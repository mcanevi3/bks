clear;clc;

Gs=tf(1,[1 1]);

syms s z;
Gss=1/(s+1);

T=1;
t=0:T:10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Continous
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[yc,tc]=step(Gs,10);
figure(1);clf;hold on;grid on;
plot(tc,yc,'k','LineWidth',2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ZOH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Gz=(1-exp(-T))*z/(z-exp(-T));
u1=ones(1,length(t));
y1=zeros(1,length(t));

for i=2:length(t)
    y1(i)=exp(-T)*y1(i-1)+(1-exp(-T))*u1(i);
end
stairs(t,y1,'b','LineWidth',2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Gz=c2d(tf([1 2],[1 1 0 0]),0.5)*tf([1 -1],1,0.5)^2

return;
u2=ones(1,length(t));
y2=zeros(1,length(t));

for i=4:length(t)
    y2(i)=(u2(i-1)-u2(i-2))/T;
end
stairs(t,y2,'m','LineWidth',2);
