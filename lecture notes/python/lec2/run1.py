import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():
    T=0.1
    t=np.arange(0,10+1,T)
    xt=np.sin(t)
    dxt=np.zeros(t.shape)
    for i in range(1,len(t)):
        dxt[i]=(xt[i]-xt[i-1])/T
  
    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("sin(t)")
    plt.title("Sinüs ve türevi")

    plt.plot(t,xt,'k')
    plt.plot(t,dxt,'r')
    plt.show()
############################
# q2
############################
def fun_q2():
    T=0.1
    t=np.arange(0,10+1,T)
    xt=np.exp(-t)
    q=np.zeros(np.size(t))
    for i in range(1,len(t)):
        q[i]=q[i-1]+T*xt[i-1]
  
    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("e^(-t)")
    plt.title("e^(-t) ve integrali")

    plt.plot(t,xt,'k')
    plt.plot(t,q,'r')
    plt.show()
############################
# q3
############################
def fun_q3():
    T=1
    t=np.arange(0,3+1,T)
    xt=np.array([1,2,-1,3])

    T=0.01
    tnew=np.arange(0,3+1,T)
    yt=np.zeros(tnew.shape)
    for i in range(0,len(t)):
        for j in range(0,100):
            yt[100*i+j]=xt[i]
  
    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("Veri tutucu")
    plt.title("ZOH örneği")

    plt.stem(t,xt,'k')
    plt.plot(tnew,yt,'r')
    plt.show()
############################
# q4
############################
def fun_q4():
    T=1
    t=np.arange(0,3+1,T)
    xt=np.array([1,2,-1,3])

    T=0.01
    tnew=np.arange(0,3+1,T)
    yt=np.zeros(tnew.shape)
    for i in range(0,len(t)-1):
        for j in range(0,100):
            yt[100*i+j]=xt[i]+0.01*j*(xt[i+1]-xt[i])
  
    plt.grid('minor')
    plt.xlabel("Zaman(s)")
    plt.ylabel("Veri tutucu")
    plt.title("FOH örneği")

    plt.stem(t,xt,'k')
    plt.plot(tnew,yt,'r')
    plt.show()