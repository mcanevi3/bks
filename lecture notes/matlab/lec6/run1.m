clear;clc;

figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Re");ylabel("Im");title("w_n sabit ve 0<\zeta<1");
T=1;
zetavec=0.1:0.1:1;
wnvec=1:6;
for i=1:length(wnvec)
    wn=wnvec(i);
    fx=exp(-zetavec*wn*T).*cos(sqrt(1-zetavec.^2)*wn*T);
    fy=exp(-zetavec*wn*T).*sin(sqrt(1-zetavec.^2)*wn*T);
    plot(fx,fy,'Color',[i/length(wnvec),0,0],'LineWidth',2,'DisplayName',"w_n:"+string(wn));
end
legend("show","location","best")
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);

print("../../img/"+"lec6_plot1.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Re");ylabel("Im");title("\zeta sabit 0<w_n<100");
T=1;
zetavec=0.1;
wnvec=1:0.1:100;
for i=1:length(zetavec)
    zeta=zetavec(i);
    fx=exp(-zeta*wnvec*T).*cos(sqrt(1-zeta.^2)*wnvec*T);
    fy=exp(-zeta*wnvec*T).*sin(sqrt(1-zeta.^2)*wnvec*T);
    plot(fx,fy,'Color',[i/length(zetavec),0,0],'LineWidth',2,'DisplayName',"\zeta:"+string(zeta));
end
legend("show","location","best")
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
print("../../img/"+"lec6_plot2.eps",'-depsc','-r150');
figure(3);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Re");ylabel("Im");title("\zeta sabit 0<w_n<100");
T=1;
zetavec=0.5;
wnvec=1:0.1:100;
for i=1:length(zetavec)
    zeta=zetavec(i);
    fx=exp(-zeta*wnvec*T).*cos(sqrt(1-zeta.^2)*wnvec*T);
    fy=exp(-zeta*wnvec*T).*sin(sqrt(1-zeta.^2)*wnvec*T);
    plot(fx,fy,'Color',[i/length(zetavec),0,0],'LineWidth',2,'DisplayName',"\zeta:"+string(zeta));
end
legend("show","location","best")
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);

print("../../img/"+"lec6_plot3.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Re");ylabel("Im");title("ts sabit");
T=1;
zetavec=0.01:0.01:1;
tsvec=[5,10,30];
for i=1:length(tsvec)
    ts=tsvec(i);
    wn=4./(ts.*zetavec);
    fx=exp(-zetavec.*wn*T).*cos(sqrt(1-zetavec.^2).*wn*T);
    fy=exp(-zetavec.*wn*T).*sin(sqrt(1-zetavec.^2).*wn*T);
    plot(fx,fy,'x','Color',[i/length(tsvec),0,0],'LineWidth',2,'DisplayName',"t_s:"+string(ts));
end
legend("show","location","best")
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
print("../../img/"+"lec6_plot4.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
