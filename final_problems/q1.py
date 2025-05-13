from numpy import *
from control import *
from sympy import *
from matplotlib.pyplot import *

ts=1
os=10/100

zeta=-log(os)/sqrt(np.pi**2+log(os)**2)
wn=4/(ts*zeta)

s=Symbol('s')
pds=s**2+2*zeta*wn*s+wn**2
p=Symbol('p')
pes=s+p

kd=Symbol('kd')
kp=Symbol('kp')
ki=Symbol('ki')

Gss=1/(s**2+s+1)
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
Gzs=tf(num,den)

figure(1)
clf()
rlocus(Gzs)
# show()

pvec=np.arange(0.1,20,0.1)
mvec=np.zeros(pvec.shape)
fpzs=lambdify(p,Poly(pzs2,s).all_coeffs()) 

for i,pval in enumerate(pvec):
    zeross=np.roots(fpzs(pval))
    mz=[np.abs(np.real(z))/(zeta*wn) for z in zeross]
    mp=pval/(zeta*wn)
    mvec[i]=min([min(mz),mp])

index=argmax(mvec)
mval=mvec[index]
pval=pvec[index]

print(mval,pval)