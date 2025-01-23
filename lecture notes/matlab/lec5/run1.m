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

print("../../img/"+"lec5_rlocus1.eps",'-depsc','-r150');

num=[-3.58 2];
den=[1 0.3 4.22 0 -0.4];
czeros=roots(num);
poles=roots(den);
Gz=tf(num,den,T);
figure(2);clf;
rlocus(Gz);hold on;
set(findall(gca, 'Type', 'line'),'LineWidth',2);
plot(real(czeros),imag(czeros),'ko','LineWidth',2);
plot(real(poles),imag(poles),'kx','LineWidth',2);
title("Kök Eğrisi");
xlim([-1.1 1.1]);
ylim([-1.1 1.1]);
print("../../img/"+"lec5_rlocus2.eps",'-depsc','-r150');

syms z;
syms k real;
num=-3.58*z+2;
den=z^4+0.3*z^3+4.22*z^2-0.4;
expr_k=-den/num;
expr=diff(expr_k,z);
[ns,ds]=numden(expr);
ns=-3.58*ns/(179.0)^2;
ds=-3.58*ds/(179.0)^2;
ds=expand(ds);
disp(vpa(ns,4))
disp(vpa(ds,4))
sol=solve(diff(expr_k,z)==0);
sol=double(sol);
sol

figure(2);
sol=sol(imag(sol)==0);
plot(real(sol),imag(sol),'k+','LineWidth',4);
print("../../img/"+"lec5_rlocus3.eps",'-depsc','-r150');
