clear;clc;
%%%%%%%%%%%%%%%%%%%%%%%%
m=1;
b=1;
k=1;

Gs=tf(1,[m b k]);
[y,t]=step(Gs,10);
%%%%%%%%%%%%%%%%%%%%%%%%
T=0.1;
fac1=(2*m+b*T)/(m+b*T+k*T^2);
fac2=-m/(m+b*T+k*T^2);
fac3=T^2/(m+b*T+k*T^2);

tvec=0:T:10;
xt=zeros(size(tvec));
ut=ones(size(tvec));
for i=3:length(tvec)
    xt(i)=fac1*xt(i-1)+fac2*xt(i-2)+fac3*ut(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%
T=0.5;
fac1=(2*m+b*T)/(m+b*T+k*T^2);
fac2=-m/(m+b*T+k*T^2);
fac3=T^2/(m+b*T+k*T^2);

tvec2=0:T:10;
xt2=zeros(size(tvec2));
ut2=ones(size(tvec2));
for i=3:length(tvec2)
    xt2(i)=fac1*xt2(i-1)+fac2*xt2(i-2)+fac3*ut2(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%
figure(1);clf;hold on;grid minor;ax1=gca;
xlabel("Zaman(s)");ylabel("y(t)");title("Yay-kütle-damper yanıtı");
set(gca,'MinorGridColor','k','MinorGridAlpha',1);
legend("show");
plot(t,y,'k','LineWidth',2,'DisplayName','step');
stem(tvec,xt,'r','LineWidth',2,'DisplayName',"fark denklemi(T=0.1)",'Marker','none');
stem(tvec2,xt2,'b','LineWidth',2,'DisplayName',"fark denklemi(T=0.5)",'Marker','none');
print("../../img/"+"lec3_step1.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%
T=0.25;
Gz=c2d(tf(1,[m b k]),T);
[yz,tz]=step(Gz,10);

T=1;
Gz2=c2d(tf(1,[m b k]),T);
[yz2,tz2]=step(Gz2,10);

figure(2);clf;hold on;grid minor;ax2=gca;
set(gca,'MinorGridColor','k','MinorGridAlpha',1);
legend("show");
xlabel("Zaman(s)");ylabel("y(t)");title("Yay-kütle-damper yanıtı");
plot(t,y,'k','LineWidth',2,'DisplayName','step');
stem(tz,yz,'r','LineWidth',2,'DisplayName',"fark denklemi(T=0.25)",'Marker','none');
stem(tz2,yz2,'b','LineWidth',2,'DisplayName',"fark denklemi(T=1)",'Marker','none');
print("../../img/"+"lec3_step2.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%
