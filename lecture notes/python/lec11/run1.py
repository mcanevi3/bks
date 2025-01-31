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
    t=np.arange(0,5,T)
    u=0.1*np.sin(4*t)
    x1=np.zeros(t.shape)
    x2=np.zeros(t.shape)
    y=np.zeros(t.shape)

    for k in range(1,len(t)):
        x1[k]=x1[k-1]+0.1*x2[k-1]
        x2[k]=-0.1*x1[k-1]+0.95*x2[k-1]+0.1*u[k-1]
        y[k-1]=x1[k-1]

    plt.stem(t,x1,'b')
    plt.stem(t,x2,'r')
    plt.show()
fun_q1()