clear;clc;

T=0.2;

ts=1;
os=10/100;

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);

disp("zeta:"+string(zeta));
disp("wn:"+string(wn));
disp("roots:");
disp(roots([1 2*zeta*wn wn^2]));
zpoles=exp(T*roots([1 2*zeta*wn wn^2]));
disp("z domain:");
disp(zpoles);
coef=conv([1 -zpoles(1)],[1 -zpoles(2)]);
disp(coef);

Gs=tf(1,[1 2]);


Gz=c2d(Gs,T,'zoh');
Gz
syms s z;
Gzz=0.1648/(z-0.6703);
syms k;
Tzz=(k*Gzz)/(1+k*Gzz);
Tzz=simplifyFraction(Tzz);
[pzs,pcs]=numden(Tzz);
coef_pcs=coeffs(pcs,z,'all');
coef_pcs=coef_pcs/coef_pcs(1);
coef_pcs
prob=coef_pcs==[1 -exp(-(4/ts)*T)];
sol=solve(prob);
sol=double(sol);
kval=sol;

Tz=feedback(kval*Gz,1);
Tz
[y,t]=step(Tz);
figure(1);clf;hold on;grid on;
stairs(t,y,'k','LineWidth',2);

