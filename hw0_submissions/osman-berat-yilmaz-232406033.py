import control #matlab benzeri bir kütüphane
import numpy as np #matematiksel işlemler yapmak için yazılan kod
import matplotlib.pyplot as plt  #ekrana bir şeyler cizdirmek icin yazılan kod

# 1/(s+2) örnek

Gs = control.tf([5], [1, 0.05])
T = 0.1

# Gz=0.09 / (z-0.82) örnek
Gz = control.c2d(Gs, T, method='zoh')

t2 = np.arange(0, 10,0.1)  #0 başla 10 a kadar git 10 dahil değil
y2 = np.sin(t2)  #sinüs dalgası oluşturur

plt.stem(t2,y2,'r')#r red kırmızı   stem=cubuk cubuk ciziyor
plt.show() #cizdir ve göster

print(Gz) #Gz yi yazdırır