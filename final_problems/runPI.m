clear;clc;

ts=1;
os=10/100;

syms s;
Gss=1/(s^2+2*s+0.1);

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);

pds=s^2+2*zeta*wn*s+wn^2;
syms p real;
pes=s+p;
coef_pds=coeffs(pds*pes,s,'all');

syms kp ki real;
Fss=kp+ki/s;
Tss=(Fss*Gss)/(1+Fss*Gss);
[pzs,pcs]=numden(Tss);
coef_pcs=coeffs(pcs,s,'all');
coef_pcs=coef_pcs/coef_pcs(1);

prob=coef_pcs==coef_pds;
sol=solve(prob);

kpval=double(sol.kp);
kival=double(sol.ki);
pval=double(sol.p);

[num,den]=numden(Gss);
Gs=tf(double(coeffs(num,s,'all')),double(coeffs(den,s,'all')));

Fs=tf([kpval,kival],[1,0]);
Ts=feedback(Fs*Gs,1);
info=stepinfo(Ts);
[y,t]=step(Ts);

figure(1);clf;hold on;grid on;
plot(t,y,'LineWidth',2);
title("os:"+string(info.Overshoot)+" ts:"+string(info.SettlingTime))

