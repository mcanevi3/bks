clear;clc;
T=0.2;
ts=1;
os=10/100;
zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);
zpoles=exp(T*roots([1 2*zeta*wn wn^2]));
coef=conv([1 -zpoles(1)],[1 -zpoles(2)]);
Gs=tf(1,[1 2]);
Gz=c2d(Gs,T,'zoh');
syms s z;
Gzz=0.1648/(z-0.6703);


syms kd kp real;
Fzz=((kd+kp)*z-kd)/z;
Tzz=(Fzz*Gzz)/(1+Fzz*Gzz);
Tzz=simplifyFraction(Tzz);
[pzs,pcs]=numden(Tzz);
coef_pcs=coeffs(pcs,z,'all');
coef_pcs=coef_pcs/coef_pcs(1);
prob=coef_pcs==coef;
sol=solve(prob);
kdval=double(sol.kd);
kpval=double(sol.kp);
kdval
kpval
Fz=tf([kpval+kdval -kdval],[1 0],T);
Tz=feedback(Fz*Gz,1);

[y,t]=step(Tz);
figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
stem(t,y,'k','LineWidth',2);
print("../../img/"+"lec8_step1.eps",'-deps','-r150');