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

syms s z;
Gzz=0.1648/(z-0.6703);
syms k;
Tzz=(k*Gzz)/(1+k*Gzz);
Tzz=simplifyFraction(Tzz);
[pzs,pcs]=numden(Tzz);
coef_pcs=coeffs(pcs,z,'all');
coef_pcs=coef_pcs/coef_pcs(1);
prob=coef_pcs==[1 -exp(-(4/ts)*T)];
sol=solve(prob);
sol=double(sol);
kval=sol;

Tz=feedback(kval*Gz,1);
[y,t]=step(Tz);
figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");ylabel("y(kT)");title("Basamak Yanıtı");
stem(t,y,'k','LineWidth',2);
print("../../img/"+"lec7_step1.eps",'-depsc','-r150');


figure(2);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Re");ylabel("Im");title("Kök Eğrisi");
zetavec=0:0.1:1;
fx=exp(-zetavec*wn*T).*cos(sqrt(1-zetavec.^2)*wn*T);
fy=exp(-zetavec*wn*T).*sin(sqrt(1-zetavec.^2)*wn*T);
plot(fx,fy,'Color','r','LineWidth',2);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
r=exp(-(4/ts)*T);
rectangle('Position',[-r,-r,2*r,2*r],'Curvature',[1 1],'EdgeColor','b');
fx=exp(-zeta*wn*T).*cos(sqrt(1-zeta.^2)*wn*T);
fy=exp(-zeta*wn*T).*sin(sqrt(1-zeta.^2)*wn*T);
plot(fx,fy,'kx','LineWidth',2);
plot(0.4493,0,'kx','LineWidth',2);
print("../../img/"+"lec7_rlocus1.eps",'-depsc','-r150');

syms k real;
sol=solve(-0.1648*k+0.6703==-0.4493);
sol=double(sol);
Tz=feedback(sol*Gz,1);
stepinfo(Tz)

[y,t]=step(Tz);
figure(3);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");ylabel("y(kT)");title("Basamak Yanıtı");
stem(t,y,'k','LineWidth',2);
print("../../img/"+"lec7_step2.eps",'-depsc','-r150');

s=log(-0.4496)/T;
s
