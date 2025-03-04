import matplotlib.pyplot as plt
import numpy as np

vec=np.array([1,2,3])
plt.plot(vec,'o')
plt.show()

t=np.arange(0,2,0.1)
plt.plot(t,np.sin(4*t),'m',label="sin(4t)")
plt.plot(t,np.sin(8*t),'r',label="sin(8t)")
plt.title("sinüs grafiği")
plt.xlabel("Zaman(s)")
plt.ylabel("x(t)")
plt.grid(color = 'black', linestyle = '--', linewidth = 1.5)
plt.legend()
plt.savefig('test.png')
plt.show()
