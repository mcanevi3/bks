import numpy as np
import matplotlib.pyplot as plt
import control

t=np.arange(0,80,0.1)
u=np.ones_like(t)
x=np.zeros_like(t)

for i in range(len(t)):
    x[i]=0.95*x[i-1]+5*u[i-1]

Gs=control.tf(5,[1,0.05])
ty,y=control.step_response(Gs)
plt.plot(ty,y,'k')
plt.stem(t,x,'r')
plt.grid()
plt.show()