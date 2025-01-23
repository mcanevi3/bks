clear;clc;

T=0.2;
den=[1 0.3 4.22 -3.58 -0.4];
poles=roots(den);
Gz=tf(1,den,T);
figure(1);clf;
rlocus(Gz);hold on;
set(findall(gca, 'Type', 'line'),'LineWidth',2);
plot(real(poles),imag(poles),'kx','LineWidth',2);
title("Kök Eğrisi");
xlim([-3 3]);
ylim([-3 3]);

