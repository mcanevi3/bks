clear;clc;

ts=1;
os=10/100;

syms s;
Gss=1/(s^2+s+1);

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);

syms p real;
pds=s^2+2*zeta*wn*s+wn^2;
pes=s+p;
coef_pds=coeffs(pds*pes,s,'all');

syms kd kp ki real;
Fss=kd*s+kp+ki/s;
Tss=(Fss*Gss)/(1+Fss*Gss);
[pzs,pcs]=numden(Tss);
coef_pcs=coeffs(pcs,s,'all');
coef_pcs=coef_pcs/coef_pcs(1);

prob=coef_pcs==coef_pds;
sol=solve(prob);

kdval=double(sol.kd);
kpval=double(sol.kp);
kival=double(sol.ki);

[num,den]=numden(Gss);
Gs=tf(double(coeffs(num,s,'all')),double(coeffs(den,s,'all')));

Fs=tf([kdval,kpval,kival],[1 0]);
Ts=feedback(Fs*Gs,1);
info=stepinfo(Ts);
[y,t]=step(Ts);

figure(1);clf;hold on;grid on;
plot(t,y,'LineWidth',2);
title("os:"+string(info.Overshoot)+" ts:"+string(info.SettlingTime))

