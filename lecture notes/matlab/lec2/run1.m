clear;clc;

t=0:0.1:10;
xt=sin(t);
dxt=zeros(size(t));
T=t(2)-t(1);
for i=2:length(t)
    dxt(i)=(xt(i)-xt(i-1))/T;
end
figure(1);clf;hold on;grid on;xlabel("Zaman(s)");ylabel("x(t)");title("sin(t) ve türevi");
plot(t,xt,'k','LineWidth',2);
plot(t,dxt,'r','LineWidth',2);
print("../../img/"+"lec2_plot1.eps",'-depsc','-r150');

%%
t=0:1:10;
xt=sin(t);
dxt=zeros(size(t));
T=t(2)-t(1);
for i=2:length(t)
    dxt(i)=(xt(i)-xt(i-1))/T;
end
figure(1);clf;hold on;grid on;xlabel("Zaman(s)");ylabel("x(t)");title("sin(t) ve türevi");
plot(t,xt,'k','LineWidth',2);
plot(t,dxt,'r','LineWidth',2);
print("../../img/"+"lec2_plot2.eps",'-depsc','-r150');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t=0:1:10;
xt=exp(-t);
q=zeros(size(t));
T=t(2)-t(1);
for i=2:length(t)
    q(i)=q(i-1)+xt(i-1)*T;
end
figure(1);clf;hold on;grid on;xlabel("Zaman(s)");ylabel("x(t)");title("exp(-t) ve integrali");
plot(t,xt,'k','LineWidth',2);
plot(t,q,'r','LineWidth',2);
print("../../img/"+"lec2_plot3.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
T=1;
t=0:T:3;
xt=[1,2,-1,3];

tnew=0:0.01:4;
yt=zeros(size(tnew));
for i=1:length(t)
    for j=1:100
        yt(100*(i-1)+j)=xt(i);
    end
end
figure(1);clf;hold on;grid on;xlabel("Zaman(s)");ylabel("x(t)");title("ZOH örneği");
stem(t,xt,'k','LineWidth',2);
plot(tnew,yt,'r','LineWidth',2);
print("../../img/"+"lec2_plot4.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
