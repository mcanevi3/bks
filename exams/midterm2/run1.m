clear;clc;
Gs=tf(12,[1 5 4]);
T=1;
Gz=tf([3+exp(-4)-4*exp(-1) exp(-1)+3*exp(-5)-4*exp(-4)],[1 -(exp(-1)+exp(-4)) exp(-5)],1);
Gz

figure(1);hold on;grid minor;
[y,t]=step(Gs,10);
plot(t,y,'k','LineWidth',2);
[y,t]=step(Gz,10);
stem(t,y,'b','LineWidth',2);

t=0:T:6;
u=ones(size(t));
y=zeros(size(t));
for k=3:length(t)
    y(k)=0.39*y(k-1)-0.01*y(k-2)+1.55*u(k-1)+0.31*u(k-2);
end
stem(t,y,'m','LineWidth',2);
