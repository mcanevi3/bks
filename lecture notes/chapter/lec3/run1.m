clear;clc;

m=1;
b=1;
k=1;
T=0.1;

t=0:T:10;
u=1*ones(1,length(t));
x=zeros(1,length(t));
for i=3:length(t)
    x(i)=(2*m+b*T)/(m+b*T+k*T^2)*x(i-1)-m/(m+b*T+k*T^2)*x(i-2)+(T^2)/(m+b*T+k*T^2)*u(i);
end
disp("#1:"+string((2*m+b*T)/(m+b*T+k*T^2)));
disp("#2:"+string(m/(m+b*T+k*T^2)));
disp("#3:"+string(T^2/(m+b*T+k*T^2)));

figure(1);clf;hold on;grid on;
xlabel("t(s)");ylabel("x(t)");
plot(t,x,'b','LineWidth',2);

wn=sqrt(k/m);
zeta=b*sqrt(m)/(2*m*sqrt(k));
phi=acos(zeta);

Gz=tf([1 0],[1 -1],T)-1/sqrt(1-zeta^2)*tf([sqrt(1-zeta^2) exp(-zeta*wn*T)*sin(wn*sqrt(1-zeta^2)*T-phi) 0],[1 -2*exp(-zeta*wn*T)*cos(wn*sqrt(1-zeta^2)*T) exp(-2*zeta*wn*T)],T);
Gz=Gz*tf([1 -1],[1 0],T);
Gz
Gz=minreal(Gz)
[y,t]=step(Gz,t);
plot(t,y,'r','LineWidth',2);
