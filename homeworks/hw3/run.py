import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import control 

k=1
Gs=control.tf(1,[1,1+k])

Ts=control.feedback(k*Gs,1)
t,y=control.step_response(Ts,2)
plt.plot(t,y,'b')

k=10
Gs=control.tf(1,[1,1+k])

Ts=control.feedback(k*Gs,1)
t,y=control.step_response(Ts,2)
plt.plot(t,y,'r')

plt.xlabel("Zaman")
plt.ylabel("y(t)")
plt.title("Basamak yanitlarinin karsilastirilmasi")
plt.savefig('response.png')
plt.show()