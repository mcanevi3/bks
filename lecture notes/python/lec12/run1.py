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

    phic=np.hstack((B,A*B))

    ts=1
    os=10/100
    T=0.1

    zeta=-np.log(os)/np.sqrt(np.pi**2+np.log(os)**2)
    wn=4/(ts*zeta)
    poles_s=np.array([-zeta*wn+1j*wn*np.sqrt(1-zeta**2),-zeta*wn-1j*wn*np.sqrt(1-zeta**2)])
    poles_z=np.exp(poles_s*T)

    z=sym.Symbol('z')
    pdz=(z-poles_z[0])*(z-poles_z[1])
    pdz=sym.expand(pdz)

    coef=np.float32(sym.Poly(pdz,z).all_coeffs())
    pdA=coef[0]*A*A+coef[1]*A+coef[2]*np.eye(2)
    
    K=-np.array([0,1])*np.linalg.inv(phic)*pdA
    print(K)
    t=np.arange(0,5,T)
    u=0.1*np.sin(4*t)
    r=np.ones(t.shape)
    x1=np.zeros(t.shape)
    x2=np.zeros(t.shape)
    y=np.zeros(t.shape)

    for k in range(1,len(t)):
        u[k-1]=K[0,0]*x1[k-1]+K[0,1]*x2[k-1]+r[k-1]
        x1[k]=x1[k-1]+0.1*x2[k-1]
        x2[k]=-0.1*x1[k-1]+0.95*x2[k-1]+0.1*u[k-1]
        y[k-1]=x1[k-1]

    plt.stem(t,x1,'b')
    plt.stem(t,x2,'r')
    plt.show()
############################
# q2
############################
def fun_q2():

    A=np.matrix('1,0.1;-0.1,0.95')
    B=np.matrix('0;0.1')
    C=np.matrix('1,0')

    phic=np.hstack((B,A*B))

    ts=1
    os=10/100
    T=0.1

    zeta=-np.log(os)/np.sqrt(np.pi**2+np.log(os)**2)
    wn=4/(ts*zeta)
    poles_s=np.array([-zeta*wn+1j*wn*np.sqrt(1-zeta**2),-zeta*wn-1j*wn*np.sqrt(1-zeta**2)])
    poles_z=np.exp(poles_s*T)

    z=sym.Symbol('z')
    pdz=(z-poles_z[0])*(z-poles_z[1])
    pdz=sym.expand(pdz)

    coef=np.float32(sym.Poly(pdz,z).all_coeffs())
    pdA=coef[0]*A*A+coef[1]*A+coef[2]*np.eye(2)
    
    K=-np.array([0,1])*np.linalg.inv(phic)*pdA
    print(K)
    t=np.arange(0,5,T)
    u=0.1*np.sin(4*t)
    r=np.ones(t.shape)
    x1=np.zeros(t.shape)
    x2=np.zeros(t.shape)
    y=np.zeros(t.shape)

    V=1/0.03295620415109517
    for k in range(1,len(t)):
        u[k-1]=K[0,0]*x1[k-1]+K[0,1]*x2[k-1]+V*r[k-1]
        x1[k]=x1[k-1]+0.1*x2[k-1]
        x2[k]=-0.1*x1[k-1]+0.95*x2[k-1]+0.1*u[k-1]
        y[k-1]=x1[k-1]

    plt.stem(t,x1,'b')
    plt.stem(t,x2,'r')
    plt.show()
