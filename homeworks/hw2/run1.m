clear;clc;

Gs=tf(1,[1 2 4]);
[ys,t]=step(Gs,5);

figure(1);clf;hold on;grid minor;
set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");
title("0.1<p<0.5");
pvec=0.1:0.1:0.5;
for i=1:length(pvec)
    pval=pvec(i);
    Gs1=Gs*tf(pval,[1 pval]);
    [y,t]=step(Gs1,t);
    plot(t,y,'Color',[i/length(pvec),0,0]);
end
plot(t,ys,'k','LineWidth',2);
print("plot1.eps",'-depsc','-r150');

figure(2);clf;hold on;grid minor;
set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");
title("5<p<10");
pvec=5:1:10;
for i=1:length(pvec)
    pval=pvec(i);
    Gs1=Gs*tf(pval,[1 pval]);
    [y,t]=step(Gs1,t);
    plot(t,y,'Color',[i/length(pvec),0,0]);
end
plot(t,ys,'k','LineWidth',2);
print("plot2.eps",'-depsc','-r150');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3);clf;hold on;grid minor;
set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");
title("0.1<z<0.5");
zvec=0.1:0.1:0.5;
for i=1:length(zvec)
    zval=zvec(i);
    Gs1=Gs*tf([1 zval],zval);
    [y,t]=step(Gs1,t);
    plot(t,y,'Color',[i/length(zvec),0,0]);
end
plot(t,ys,'k','LineWidth',2);
print("plot3.eps",'-depsc','-r150');

figure(4);clf;hold on;grid minor;
set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");
title("5<z<10");
zvec=5:1:10;
for i=1:length(zvec)
    zval=zvec(i);
    Gs1=Gs*tf([1 zval],zval);
    [y,t]=step(Gs1,t);
    plot(t,y,'Color',[i/length(zvec),0,0]);
end
plot(t,ys,'k','LineWidth',2);
print("plot4.eps",'-depsc','-r150');
