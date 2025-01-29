clear;clc;


Gs=tf(1,[1 2])-tf(1,[1 8]);
Gz=tf([1 0],[1 -exp(-2)],1)-tf([1 0],[1 -exp(-8)],1)

