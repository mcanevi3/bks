clear;clc;

T=0.5;
tvec=0:T:10;

f1=@(t)sin(t);
f1vec=f1(tvec);

figure(1);clf;hold on;grid on;
xlabel("Zaman(s)");ylabel("y(t)");title("sin(t) grafiği");
plot(0:0.01:10,f1(0:0.01:10),'k','LineWidth',2);
stem(tvec,f1(tvec),'r','LineWidth',2);
print("../../img/"+"lec5_plot1.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms t s z;
yt=dirac(t);
ys=laplace(yt);
yz=ztrans(ys,s,z);
disp("y(t):"+string(yt));
disp("y(s):"+string(ys));
disp("y(z):"+string(yz));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Gss=1/(s^3+4*s^2+5*s+6);
expr=partfrac(Gss);
pretty(expr)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Gss=t*exp(-s*t);
expr=int(Gss);
subs(expr,t,inf)-subs(expr,t,0)

