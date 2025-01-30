import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():
    m=1
    b=1
    k=1
    T=0.1
    fac1=(2*m+b*T)/(m+b*T+k*T**2)
    fac2=-m/(m+b*T+k*T**2)
    fac3=T**2/(m+b*T+k*T**2)
    tvec=np.arange(0,10+1,T)
    xt=np.zeros(tvec.shape)
    ut=np.ones(tvec.shape)
    for i in range(0,len(tvec)):
        if i==0:
            xt[i]=fac1*0+fac2*0+fac3*0
        elif i==1:
            xt[i]=fac1*xt[i-1]+fac2*0+fac3*ut[i-1]
        else:
            xt[i]=fac1*xt[i-1]+fac2*xt[i-2]+fac3*ut[i-1]

    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("x(t)")
    plt.title("Yay-kütle-damper sistem yanıtı")

    Gz=control.tf(1,np.array([m,b,k]))
    tc, yc=control.step_response(Gz)
    plt.plot(tc,yc,'k')
    plt.stem(tvec,xt,'b')
    plt.show()
############################
# q2
############################
def fun_q2():
    m=1
    b=1
    k=1
    
    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("x(t)")
    plt.title("Yay-kütle-damper sistem yanıtı")

    Gz=control.tf(1,np.array([m,b,k]))
    tc, yc=control.step_response(Gz)

    Gz1=control.c2d(control.tf(1,np.array([m,b,k])),0.1)
    tc1, yc1=control.step_response(Gz1)

    Gz2=control.c2d(control.tf(1,np.array([m,b,k])),0.5)
    tc2, yc2=control.step_response(Gz2)

    plt.plot(tc,yc,'k')
    plt.stem(tc1,yc1,'r')
    plt.stem(tc2,yc2,'b')
    plt.show()
fun_q2()