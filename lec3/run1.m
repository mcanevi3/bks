clear;clc;

Gs=tf(1,[1 1]);

syms s z;
Gss=1/(s+1);

T=0.5;
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
% Gz=(1-exp(-T))*z/(z-exp(-T));
% Gz=tf(1-exp(-T),[1 -exp(-T)],T);
u1=ones(1,length(t));
y1=zeros(1,length(t));

for i=2:length(t)
    y1(i)=exp(-T)*y1(i-1)+(1-exp(-T))*u1(i);
end
stairs(t,y1,'b','LineWidth',2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% FOH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp=Gss*(T*s+1)/(T*s^2);
temp=partfrac(temp);

temp2=inv(1-exp(-T)*inv(z))-inv(1-inv(z))+2*T*inv(z)/(1-inv(z))^2;
temp3=(1-inv(z))^2*temp2;
[num,den]=numden(temp3);
Gz=tf(double(coeffs(num,z,'all')),double(coeffs(den,z,'all')),T);
Gz=tf(zpk(Gz));
Gz

u2=ones(1,length(t));
y2=zeros(1,length(t));

for i=1:length(t)
    if i==1
        y2(i)=0.6065*0+0.6065*0-0.2131*0;
    elseif i==2
        y2(i)=0.6065*y2(i-1)+0.6065*u2(i-1)-0.2131*0;
    else
        y2(i)=0.6065*y2(i-1)+0.6065*u2(i-1)-0.2131*u2(i-2);
    end
end
stairs(t,y2,'m','LineWidth',2);


