import control
import numpy as np
import matplotlib.pyplot as plt
Gs = control.tf([5], [1, 0.05])
T = 0.1
Gz = control.c2d(Gs, T, method='zoh')
t2 = np.arange(0, 10, 0.1)
y2 = np.sin(t2)
plt.stem(t2,y2,'r')
plt.show()
print(Gz)
