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

pvec=np.arange(0.1,0.5,0.1)
for p in pvec:
    Gs1=Gs*control.tf(p,[1,p])
    t,y =control.step_response(Gs1,50)
    plt.plot(t,y,'r',linewidth=2)
plt.savefig("plot1.png")
plt.show()


Gs=control.tf(1,[1,2,4])
t,y =control.step_response(Gs,10)

plt.plot(t,y,'k',linewidth=2)
plt.title("G(s)'ye ait yanıt")
plt.xlabel("Zaman(s)")
plt.ylabel("y(t)")
plt.grid("on")

pvec=np.arange(5,10,1)
for p in pvec:
    Gs1=Gs*control.tf(p,[1,p])
    t,y =control.step_response(Gs1,10)
    plt.plot(t,y,'r',linewidth=2)
plt.savefig("plot2.png")
plt.show()