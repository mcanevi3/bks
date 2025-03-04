import control as c
import numpy as np
import matplotlib.pyplot as plt

num=np.array([1])
den=np.array([1,3])
sys = c.tf(num, den)
print(sys)
print(c.tf2ss(sys))

A=np.array([[1,2],[-3,-4]])
B=np.array([[1],[0]])
C=np.array([[1,0]])
D=np.array([0])
sys = c.ss(A, B, C, D)
print(sys)

print(c.ss2tf(sys))


num=np.array([1])
den=np.array([1,0.9])
sys = c.tf(num, den,dt=0.1)
print(sys)

A=np.array([[0.1,0.2],[0,0.3]])
B=np.array([[1],[0]])
C=np.array([[1,0]])
D=np.array([0])
sys = c.ss(A, B, C, D,dt=0.1)
print(sys)


num=np.array([1])
den=np.array([1,3])
Gs = c.tf(num, den)
t, y = c.initial_response(Gs,X0=3)
plt.plot(t,y)
plt.show()


num=np.array([1])
den=np.array([1,3])
Gs = c.tf(num, den)
t, y = c.step_response(Gs)
plt.plot(t,y)
plt.show()

num=np.array([1])
den=np.array([1,3])
Gs = c.tf(num, den)
T=np.arange(0,5,0.1)
u=np.sin(2*np.pi*T)
t, y = c.forced_response(Gs,T=T,U=u)
plt.plot(t,u,'k',label='input')
plt.plot(t,y,'b',label='output')
plt.legend()
plt.show()

sys = c.tf([1, 2], [1, 2, 3], name='SISO transfer function')
response = c.pole_zero_map(sys)
c.pole_zero_plot(response)
plt.show()

roots,gains=c.rlocus(sys,plot=False)
print(roots.shape)
print(gains.shape)
plt.plot(np.real(roots[:,0]),np.imag(roots[:,0]),'r')
plt.plot(np.real(roots[:,1]),np.imag(roots[:,1]),'b')
plt.show()

c.root_locus_map(sys).plot()
plt.show()

num=np.array([1])
den=np.array([1,3])
Gs = c.tf(num, den)
Ts = c.feedback(Gs, 1, sign=1)
print(Ts)

