import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():

    A=np.matrix('1,0.1;-0.1,0.95')
    B=np.matrix('0;0.1')
    C=np.matrix('1,0')

    phic=np.vstack((C,C*A))

    z=sym.Symbol('z')
    T=0.1
    pdz=(z-0.1)*(z-0.1)
    coef=np.float32(sym.Poly(pdz,z).all_coeffs())
    pdA=coef[0]*A*A+coef[1]*A+coef[2]*np.eye(2)
    
    L=pdA*np.linalg.inv(phic)*np.transpose(np.matrix([0,1]))
    print(L)

    t=np.arange(0,5,T)
    u=0.1*np.sin(4*t)
    u=np.ones(t.shape)
    x1=np.zeros(t.shape)
    x2=np.zeros(t.shape)
    y=np.zeros(t.shape)

    x1hat=np.zeros(t.shape)
    x2hat=np.zeros(t.shape)
    yhat=np.zeros(t.shape)

    n=np.random.randn(len(t),)
    n=n/np.sqrt(np.var(n))
    n=n-np.mean(n)
    n=n*0.005
    for k in range(1,len(t)):
        y[k-1]=x1[k-1]+n[k-1]
        x1[k]=x1[k-1]+0.1*x2[k-1]
        x2[k]=-0.1*x1[k-1]+0.95*x2[k-1]+0.1*u[k-1]

        yhat[k-1]=x1hat[k-1]
        x1hat[k]=x1hat[k-1]+0.1*x2hat[k-1]+L[0,0]*(y[k-1]-yhat[k-1])
        x2hat[k]=-0.1*x1hat[k-1]+0.95*x2hat[k-1]+0.1*u[k-1]+L[1,0]*(y[k-1]-yhat[k-1])

    plt.plot(t,x1,'k')
    plt.plot(t,x1hat,'r')
    plt.plot(t,x2,'k')
    plt.plot(t,x2hat,'b')
    plt.show()

fun_q1()