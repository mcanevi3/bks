from sympy import *
import matplotlib.pyplot as plt
import control
import numpy as np
from RootLocus import *

num_gs=1
den_gs=[1,1,1]

ts=1
os=10/100

zeta=-np.log(os)/np.sqrt(np.pi**2+np.log(os)**2)
wn=4/(ts*zeta)

s=Symbol('s')
pds=s**2+2*zeta*wn*s+wn**2

kd=Symbol('kd')
kp=Symbol('kp')

Gss=num_gs/(den_gs[0]*s**2+den_gs[1]*s+den_gs[2])
Fss=kd*s+kp
Tss=(Fss*Gss)/(1+Fss*Gss)
Tss=simplify(Tss)
pzs,pcs=fraction(Tss)

coef_pcs=Poly(pcs,s).all_coeffs()
coef_pds=Poly(pds,s).all_coeffs()
print(coef_pds)
prob=[]
for i in range(len(coef_pcs)):
    prob.append(coef_pcs[i]-coef_pds[i])
sol=solve(prob,[kd,kp])
kdval=float(sol[kd])
kpval=float(sol[kp])

plt.figure(1)
Fs=control.tf([kdval,kpval],1)
Gs=control.tf(num_gs,den_gs)
Ts=control.feedback(Fs*Gs,1)
print(Ts)

cpoles=[complex(x )for x in control.poles(Ts)]
czeros=[complex(x )for x in control.zeros(Ts)]
print(cpoles)
print(czeros)

t,y=control.step_response(Ts)
plt.plot(t,y,'k',linewidth=2)
plt.grid()
info=control.step_info(Ts)
tsval=np.round(info['SettlingTime'],2)
osval=np.round(info['Overshoot'],2)
yssval=np.round(info['SteadyStateValue'],2)
plt.title(f"ts:{tsval} s os:%{osval} yss:{yssval}")
plt.savefig("pd_kontrol.png")
plt.show()