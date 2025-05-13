import control
import numpy as np
import matplotlib.pyplot as plt

def rlocus(Gs:control.tf,kvec:np.ndarray):
    num,den=control.tfdata(Gs)
    num=num[0][0]
    den=den[0][0]
    n=len(den)-1
    num=np.concatenate((np.zeros((n-len(num)+1),),num))
    poles=np.zeros((n,len(kvec)),dtype=complex)
    
    for i,k in enumerate(kvec):
        poles[:,i]=np.roots(den+k*num)
    return poles

def rlocus_plot(Gs:control.tf,kvec:np.ndarray):
    poles=rlocus(Gs,kvec)
    (row,col)=poles.shape
    for i in range(row):
        plt.plot(np.real(poles[i,:]),np.imag(poles[i,:]))

