clear;clc;

ts=1;
os=10/100;

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);

Gs=tf(wn^2,[1 2*zeta*wn wn^2])
[y,t]=step(Gs);
figure(1);clf;hold on;grid on;
plot(t,y,'k','LineWidth',2);
