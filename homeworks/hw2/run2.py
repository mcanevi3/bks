import numpy as np
import matplotlib.pyplot as plt
import control 

Gs=control.tf(1,[1,2,4])
t,y =control.step_response(Gs,50)

plt.plot(t,y,'k',linewidth=2)
plt.title("G(s)'ye ait yanıt")
plt.xlabel("Zaman(s)")
plt.ylabel("y(t)")
plt.grid("on")

zvec=np.arange(0.1,0.5,0.1)
for z in zvec:
    Gs2=Gs*control.tf([1,z],z)
    t,y =control.step_response(Gs2,50)
    plt.plot(t,y,'b',linewidth=2)
plt.savefig("plot3.png")
plt.show()


Gs=control.tf(1,[1,2,4])
t,y =control.step_response(Gs,10)

plt.plot(t,y,'k',linewidth=2)
plt.title("G(s)'ye ait yanıt")
plt.xlabel("Zaman(s)")
plt.ylabel("y(t)")
plt.grid("on")

zvec=np.arange(5,10,1)
for z in zvec:
    Gs2=Gs*control.tf([1,z],z)
    t,y =control.step_response(Gs2,10)
    plt.plot(t,y,'b',linewidth=2)
plt.savefig("plot4.png")
plt.show()