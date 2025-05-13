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
p=Symbol('p')
pes=s+p

kp=Symbol('kp')
ki=Symbol('ki')

Gss=num_gs/(den_gs[0]*s**2+den_gs[1]*s+den_gs[2])
Fss=kp+ki/s
Tss=(Fss*Gss)/(1+Fss*Gss)
Tss=simplify(Tss)
pzs,pcs=fraction(Tss)

coef_pcs=Poly(pcs,s).all_coeffs()
coef_pds=Poly(pds*pes,s).all_coeffs()

prob=[]
for i in range(len(coef_pcs)):
    prob.append(coef_pcs[i]-coef_pds[i])
print(prob)
sol=solve(prob)
print(sol)