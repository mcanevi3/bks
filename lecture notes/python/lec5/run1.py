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
    Gz=control.tf(1,np.array([1,0.3,4.22,-3.58,-0.4]),T)
    control.rlocus(Gz)
    plt.show()
############################
# q2
############################
def fun_q2():
    z=sym.Symbol('z')
    k=sym.Symbol('k')
    pol=sym.Poly(z**4+0.3*z**3+4.22*z**2-0.4-3.58*k*z+2*k,k)
    coef=pol.coeffs()
    num=sym.Poly(coef[0],z).all_coeffs()
    den=sym.Poly(coef[1],z).all_coeffs()
    num=np.array(num,dtype=np.float64)
    den=np.array(den,dtype=np.float64)

    # print(num)
    # print(den)
    Gz=control.tf(num,den)
    control.rlocus(Gz)
    plt.axis([-1.1,1.1,-1.1,1.1])
    plt.show()
############################
# q3
############################
def fun_q3():
    z=sym.Symbol('z')
    k=sym.Symbol('k')
    expr=(-3.58*z+2)/(z**4+0.3*z**3+4.22*z**2-0.4)
    sol=sym.solve(sym.diff(expr,z),z)
    print(sol)

fun_q3()
