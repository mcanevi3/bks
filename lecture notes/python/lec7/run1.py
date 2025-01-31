import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():
    T=0.2
    z,k=sym.symbols("z,k")
    num=0.1648
    den=z-0.6703
    Gz=control.tf(num,np.array(sym.Poly(den,z).all_coeffs(),dtype=np.float64),T)

    os=10/100
    ts=1
    zeta=-np.log(os)/np.sqrt(np.pi**2+np.log(os)**2)
    wn=4/(ts*zeta)
    
    # pole_s=-zeta*wn+1j*wn*np.sqrt(1-zeta**2)
    # pole_z=np.exp(pole_s*T)
    # pdz=(z-pole_z)*(z-np.conj(pole_z))
    # pdz=sym.expand(pdz)
    pole_s=-4/ts
    pole_z=np.exp(pole_s*T)
    pdz=z-pole_z

    Gzz=num/den
    Tzz=(k*Gzz)/(1+k*Gzz)
    Tzz=sym.simplify(Tzz)
    pzz,pcz=sym.fraction(Tzz)
    
    kval=sym.solve(pcz-pdz)
    kval=np.float64(kval[0])
    Fz=control.tf(kval,1,T)
    Tz=control.feedback(control.series(Fz,Gz),1)
    
    t, y = control.step_response(Tz)

    plt.stem(t,y)
    plt.xlim([0,4])
    plt.title("Basamak Yanıtı")
    plt.xlabel("Zaman(s)")
    plt.show()
    
fun_q1()