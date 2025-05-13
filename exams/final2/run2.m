clear;clc;

os=16.3/100;
ts=2;

syms s;
zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);
pds=s^2+2*zeta*wn*s+wn^2;

Gs=1/(s+0.2);
syms ki kp real;
Fs=kp+ki/s;
Ts=(Fs*Gs)/(1+Fs*Gs);
[pzs,pcs]=numden(Ts);

coef=coeffs(pcs,s,'all');
coef=coef/coef(1);
prob=coef==coeffs(pds,s,'all');
for i=1:length(prob)
    disp(prob(i))
end
sol=solve(prob);
kpval=double(sol.kp);
kival=double(sol.ki);

disp("kp:"+string(kpval));
disp("ki:"+string(kival));

Fs=tf([kpval kival],[1 0]);
[num,den]=numden(Gs);
Gs=tf(double(coeffs(num,s,'all')),double(coeffs(den,s,'all')));
Ts=feedback(Fs*Gs,1);
Ts
stepinfo(Ts)

