from sympy import *
import matplotlib.pyplot as plt
import control
import numpy as np

num_gs=1
den_gs=[1,1,1]

ts=0.5
os=10/100

zeta=-np.log(os)/np.sqrt(np.pi**2+np.log(os)**2)
wn=4/(ts*zeta)

s=Symbol('s')
pds=s**2+2*zeta*wn*s+wn**2
p=Symbol('p')
pes=s+p

kd=Symbol('kd')
kp=Symbol('kp')
ki=Symbol('ki')

Gss=num_gs/(den_gs[0]*s**2+den_gs[1]*s+den_gs[2])
Fss=kd*s+kp+ki/s
Tss=(Fss*Gss)/(1+Fss*Gss)
Tss=simplify(Tss)
pzs,pcs=fraction(Tss)

coef_pcs=Poly(pcs,s).all_coeffs()
coef_pds=Poly(pds*pes,s).all_coeffs()

prob=[]
for i in range(len(coef_pcs)):
    prob.append(coef_pcs[i]-coef_pds[i])
sol=solve(prob,[kd,kp,ki])

pzs2=pzs.subs(kd,sol[kd]).subs(kp,sol[kp]).subs(ki,sol[ki])
temp=Poly(pzs2,p).all_coeffs()

num=[float(x) for x in Poly(temp[0],s).all_coeffs()]
den=[float(x) for x in Poly(temp[1],s).all_coeffs()]
Gzs=control.tf(num,den)

pvec=np.arange(0.1,20,0.1)
mzvec=np.zeros(pvec.shape)
mpvec=np.zeros(pvec.shape)
mvec=np.zeros(pvec.shape)
fpzs=lambdify(p,Poly(pzs2,s).all_coeffs()) 

for i,pval in enumerate(pvec):
    zeross=np.roots(fpzs(pval))
    mz=[np.abs(np.real(z))/(zeta*wn) for z in zeross]
    mzvec[i]=np.min(mz)
    mp=pval/(zeta*wn)
    mpvec[i]=mp
    mvec[i]=np.min([mzvec[i],mpvec[i]])

index=np.argmax(mvec)
mval=mvec[index]
pval=pvec[index]

plt.figure(1)
plt.subplot(1,3,1)
plt.title(f"Zeros zeta*wn:{np.round(zeta*wn,2)}")
plt.xlabel("Re")
plt.ylabel("Im")
rldata=control.root_locus_map(Gzs)
plt.plot([-zeta*wn,-zeta*wn],[-4,4],'k')
plt.plot(np.real(rldata.loci[:,0]),np.imag(rldata.loci[:,0]),'r')
plt.plot(np.real(rldata.loci[:,1]),np.imag(rldata.loci[:,1]),'b')

zeross=np.roots(fpzs(pval))
for ztemp in zeross:
    plt.plot(np.real(ztemp),np.imag(ztemp),'kx')


plt.subplot(1,3,2)
plt.grid()
plt.plot(pvec,mpvec,'r',linewidth=2)
plt.plot(pvec,mzvec,'b',linewidth=2)
plt.plot(pvec,mvec,'m',linewidth=1)
plt.plot(pval,mval,'kx',linewidth=2)

kdval=float(sol[kd].subs(p,pval))
kpval=float(sol[kp].subs(p,pval))
kival=float(sol[ki].subs(p,pval))

Fs=control.tf([kdval,kpval,kival],[1,0])
Gs=control.tf(num_gs,den_gs)
Ts=control.feedback(Fs*Gs,1)
print(Ts)

cpoles=[complex(x )for x in control.poles(Ts)]
czeros=[complex(x )for x in control.zeros(Ts)]
print(cpoles)
print(czeros)

plt.subplot(1,3,3)
t,y=control.step_response(Ts)
plt.plot(t,y,'k',linewidth=2)
info=control.step_info(Ts)
tsval=np.round(info['SettlingTime'],2)
osval=np.round(info['Overshoot'],2)
plt.title(f"ts:{tsval} s os:%{osval}")
plt.show()