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
    z,ki,kp=sym.symbols("z,ki,kp")
    num=0.1648
    den=z-0.6703
    Gz=control.tf(num,np.array(sym.Poly(den,z).all_coeffs(),dtype=np.float64),T)

    os=10/100
    ts=1
    zeta=-np.log(os)/np.sqrt(np.pi**2+np.log(os)**2)
    wn=4/(ts*zeta)
    
    pole_s=-zeta*wn+1j*wn*np.sqrt(1-zeta**2)
    pole_z=np.exp(pole_s*T)
    pdz=(z-pole_z)*(z-np.conj(pole_z))
    pdz=sym.expand(pdz)

    Gzz=num/den
    Fzz=((kp+ki)*z-kp)/(z-1)

    Tzz=(Fzz*Gzz)/(1+Fzz*Gzz)
    Tzz=sym.simplify(Tzz)
    pzz,pcz=sym.fraction(Tzz)
    pcz=sym.expand(pcz)

    coef_pcz=sym.Poly(pcz,z).all_coeffs()
    coef_pdz=sym.Poly(pdz,z).all_coeffs()
    prob=[]
    for i in range(1,len(coef_pcz)):
        e1=coef_pdz[i]/coef_pdz[0]
        e2=coef_pcz[i]/coef_pcz[0]
        prob.append(e1-e2)
    sol=sym.solve(prob)
    kival=sol[ki]
    kpval=sol[kp]
    kival=float(kival)
    kpval=float(kpval)
    Fz=control.tf([kival+kpval,-kpval],np.array([1,-1]),T)
    Tz=control.feedback(control.series(Fz,Gz),1)
    
    t, y = control.step_response(Tz)
    print(Fz)
    print(Tz)
    plt.stem(t,y)
    plt.xlim([0,4])
    plt.title("Basamak Yanıtı")
    plt.xlabel("Zaman(s)")
    plt.show()
    
fun_q1()