import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control

def q1():
    s=sym.Symbol('s')
    Gs=1/(s**2+4*s+3)
    print(sym.apart(Gs))
def q2():
    s=sym.Symbol('s')
    t=sym.Symbol('t',real=True,positive=True)
    Gs=1/(s**2+4*s+3)
    us=1/s
    ys=Gs*us
    print(sym.apart(ys))
    yt=sym.inverse_laplace_transform(ys,s,t)
    print(yt)
    fyt=sym.lambdify(t, yt)
    
    tvec=np.arange(0,5,0.1)
    yvec=fyt(tvec)
    
    plt.plot(tvec,yvec)
    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("y(t)")
    plt.title("Sistem yanıtı")
    plt.savefig('q2_1.pdf',bbox_inches='tight')
    plt.show()
def q3():
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
    plt.savefig('q3_1.pdf',bbox_inches='tight')
    plt.show()
    
def q4():
    s=sym.Symbol('s')
    Gs=1/(s**3+4*s**2+5*s+6)
    print(sym.apart(Gs))
    
def q5():
    t, s = sym.symbols('t s', real=True, positive=True)
    integral = sym.integrate(t * sym.exp(-s * t), (t, 0, sym.oo))
    print(integral)

q5()
