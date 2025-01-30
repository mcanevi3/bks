import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():
    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("sin(t)")
    plt.title("Sürekli zaman ayrık zaman karşılaştırması")

    t=np.arange(0,10,0.01)
    yt=np.sin(t)
    plt.plot(t,yt,'k')

    T=0.5
    t=np.arange(0,10,T)
    yt=np.sin(t)
    plt.stem(t,yt, 'r')
    plt.show()
############################
# q2
############################
def fun_q2():
    s=sym.Symbol('s')
    t=sym.Symbol('t')
    z=sym.Symbol('z')
    yt=sym.DiracDelta(t)
    ys=sym.laplace_transform(yt,t,s)
    print(ys)

    k=sym.Symbol('k')
    yz=sym.Sum(sym.Piecewise((1, sym.And(k>-0.01,k<0.01)),(0, True)), (k, 0, 10)).doit()
    print(yz)
    
############################
# q3
############################
def fun_q3():
    s=sym.Symbol('s')
    Gs=1/(s**3+4*s**2+5*s+6)
    print(sym.apart(Gs))
    
############################
# q4
############################
def fun_q4():
    t, s = sym.symbols('t s', real=True, positive=True)
    # Define the integral
    integral = sym.integrate(t * sym.exp(-s * t), (t, 0, sym.oo))
    print(integral)
