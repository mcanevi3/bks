import numpy as np
import matplotlib.pyplot as plt
import control
import sympy as sym

def transfor_zoh():
    t=np.arange(0,120,0.1)
    u=np.ones_like(t)
    x=np.zeros_like(t)

    for i in range(len(t)):
        x[i]=0.995*x[i-1]+0.4988*u[i-1]

    Gs=control.tf(5,[1,0.05])
    ty,y=control.step_response(Gs)
    plt.plot(ty,y,'k')
    plt.stem(t,x,'r')
    plt.grid()
    plt.savefig('q1.pdf',bbox_inches='tight')
    plt.show()

def transform_foh():
    z=sym.Symbol('z')

    expr=((z-1)**2/(z))*(-(19900)/(z-1)+(100)/(z-1)**2+(19900)/(z-sym.exp(-0.005)))
    expr=sym.simplify(expr)
    n,d=sym.fraction(expr)
    

    Gs=control.tf(5,[1,0.05])
    ty,y=control.step_response(Gs)
    plt.plot(ty,y,'k')
    Gz=control.tf([0.7483,-0.2496],[1,-0.9950,0],0.1)
    ty,y=control.step_response(Gz)
    plt.stem(ty,y,'r')
    plt.grid()
    plt.savefig('q2.pdf',bbox_inches='tight')
    plt.show()

transfor_zoh()
transform_foh()