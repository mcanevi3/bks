import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():
    T=1
    zetavec=np.arange(0.1,1,0.1)
    wnvec=np.arange(1,6,1)

    for i in range(0,len(wnvec)):
        wnval=wnvec[i]
        
        fx=np.zeros(zetavec.shape)
        fy=np.zeros(zetavec.shape)
        for j in range(0,len(zetavec)):
            zetaval=zetavec[j]
            fx[j]=np.exp(-zetaval*wnval*T)*np.cos(np.sqrt(1-zetaval**2)*wnval*T)
            fy[j]=np.exp(-zetaval*wnval*T)*np.sin(np.sqrt(1-zetaval**2)*wnval*T)
    
        plt.plot(fx,fy,label="wn:"+str(wnval),color=((i+1)/len(wnvec),0,0))

    plt.legend(loc="upper left")
    plt.gca().add_patch(plt.Circle((0, 0), 1, color='k',fill=False))
    plt.show()
############################
# q2a
############################
def fun_q2a():
    T=1
    zetaval=0.1
    wnvec=np.arange(1,100+1,0.1)

    fx=np.zeros(wnvec.shape)
    fy=np.zeros(wnvec.shape)
    for i in range(0,len(wnvec)):
        wnval=wnvec[i]
        fx[i]=np.exp(-zetaval*wnval*T)*np.cos(np.sqrt(1-zetaval**2)*wnval*T)
        fy[i]=np.exp(-zetaval*wnval*T)*np.sin(np.sqrt(1-zetaval**2)*wnval*T)

    plt.plot(fx,fy,label="zeta:"+str(zetaval))
    plt.legend(loc="upper left")
    plt.gca().add_patch(plt.Circle((0, 0), 1, color='k',fill=False))
    plt.show()
############################
# q2b
############################
def fun_q2b():
    T=1
    zetaval=0.5
    wnvec=np.arange(1,100+1,0.1)

    fx=np.zeros(wnvec.shape)
    fy=np.zeros(wnvec.shape)
    for i in range(0,len(wnvec)):
        wnval=wnvec[i]
        fx[i]=np.exp(-zetaval*wnval*T)*np.cos(np.sqrt(1-zetaval**2)*wnval*T)
        fy[i]=np.exp(-zetaval*wnval*T)*np.sin(np.sqrt(1-zetaval**2)*wnval*T)

    plt.plot(fx,fy,label="zeta:"+str(zetaval))
    plt.legend(loc="upper left")
    plt.gca().add_patch(plt.Circle((0, 0), 1, color='k',fill=False))
    plt.show()

############################
# q3
############################
def fun_q3():
    T=1
    zetavec=np.arange(0.001,1,0.001)
    tsvec=np.array([5,10,30])

    for i in range(0,len(tsvec)):
        tsval=tsvec[i]
        fx=np.zeros(zetavec.shape)
        fy=np.zeros(zetavec.shape)
        for j in range(0,len(zetavec)):
            zetaval=zetavec[j]
            wnval=4/(tsval*zetaval)
            fx[j]=np.exp(-zetaval*wnval*T)*np.cos(np.sqrt(1-zetaval**2)*wnval*T)
            fy[j]=np.exp(-zetaval*wnval*T)*np.sin(np.sqrt(1-zetaval**2)*wnval*T)
        plt.plot(fx,fy,label="ts:"+str(tsval),marker='x',color=((i+1)/len(tsvec),0,0),linestyle='')
    plt.legend(loc="upper left")
    plt.gca().add_patch(plt.Circle((0, 0), 1, color='k',fill=False))
    plt.show()
fun_q3()