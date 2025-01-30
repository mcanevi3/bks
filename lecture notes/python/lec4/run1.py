import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import tbcontrol
import control
############################
# q1
############################
def fun_q1():
    pvec=np.arange(1,5+1,1)
    tsvec=np.zeros(pvec.shape)
    for i in range(0,len(pvec)):
        pval=pvec[i]
        Gs=control.tf(pval,np.array([1,pval]))
        info=control.step_info(Gs)
        tsvec[i]=info['SettlingTime']

    plt.grid('minor')
    plt.xlabel("p")
    plt.ylabel("ts")
    plt.title("p ile ts arasındaki ilişki")

    plt.plot(pvec,tsvec,'b')
    plt.show()
############################
# q2
############################
def fun_q2():
    wn=2
    zetavec=np.arange(0.1,1,0.1)
    tsvec=np.zeros(zetavec.shape)
    tsformula=np.zeros(zetavec.shape)
    for i in range(0,len(zetavec)):
        zetaval=zetavec[i]
        Gs=control.tf(wn**2,np.array([1,2*zetaval*wn,wn**2]))
        info=control.step_info(Gs)
        tsvec[i]=info['SettlingTime']
        tsformula[i]=4/(zetaval*wn)

    plt.grid('minor')
    plt.xlabel("zeta wn")
    plt.ylabel("ts")
    plt.title("zeta wn ile ts arasındaki ilişki")


    plt.plot(zetavec*wn,tsformula,'k')
    plt.plot(zetavec*wn,tsvec,'b')
    plt.show()
############################
# q3
############################
def fun_q3():
    zeta=0.6
    wnvec=np.arange(1,5+1,1)
    tsvec=np.zeros(wnvec.shape)
    tsformula=np.zeros(wnvec.shape)
    for i in range(0,len(wnvec)):
        wnval=wnvec[i]
        Gs=control.tf(wnval**2,np.array([1,2*zeta*wnval,wnval**2]))
        info=control.step_info(Gs)
        tsvec[i]=info['SettlingTime']
        tsformula[i]=4/(zeta*wnval)

    plt.grid('minor')
    plt.xlabel("zeta wn")
    plt.ylabel("ts")
    plt.title("zeta wn ile ts arasındaki ilişki")


    plt.plot(zeta*wnvec,tsformula,'k')
    plt.plot(zeta*wnvec,tsvec,'b')
    plt.show()
############################
# q4
############################
def fun_q4():
    wn=2
    zetavec=np.arange(0.1,1,0.1)
    osvec=np.zeros(zetavec.shape)
    osformula=np.zeros(zetavec.shape)
    for i in range(0,len(zetavec)):
        zetaval=zetavec[i]
        Gs=control.tf(wn**2,np.array([1,2*zetaval*wn,wn**2]))
        info=control.step_info(Gs)
        osvec[i]=info['Overshoot']
        osformula[i]=100*np.exp(-np.pi*zetaval/np.sqrt(1-zetaval**2))

    plt.grid('minor')
    plt.xlabel("zeta")
    plt.ylabel("ts")
    plt.title("zeta ile aşım arasındaki ilişki")


    plt.plot(zetavec*wn,osformula,'k',linewidth=3)
    plt.plot(zetavec*wn,osvec,'b')
    plt.show()
fun_q4()