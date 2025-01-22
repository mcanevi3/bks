clear;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pvec=1:1:5;
tsvec=zeros(size(pvec));

for i=1:length(pvec)
    pval=pvec(i);
    Gs=tf(pval,[1 pval]);
    info=stepinfo(Gs);
    tsvec(i)=info.SettlingTime;

end

figure(1);clf;hold on;grid minor;
set(gca,'MinorGridColor','k','MinorGridAlpha',1);
xlabel("p");ylabel("t_s");legend("show");
plot(pvec,tsvec,'k','LineWidth',2,'DisplayName','stepinfo');
plot(pvec,4./pvec,'b','LineWidth',2,'DisplayName','4/p');
print("../../img/"+"lec4_plot1.eps",'-depsc','-r150');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wn=2;
zetavec=0.1:0.1:1;

tsvec=zeros(size(zetavec));

for i=1:length(zetavec)
    zetaval=zetavec(i);
    Gs=tf(wn^2,[1 2*zetaval*wn wn^2]);
    info=stepinfo(Gs);
    tsvec(i)=info.SettlingTime;
end

figure(2);clf;hold on;grid minor;
set(gca,'MinorGridColor','k','MinorGridAlpha',1);
xlabel("\zeta w_n");ylabel("t_s");legend("show");

plot(zetavec*wn,tsvec,'k','LineWidth',2,'DisplayName','stepinfo');
plot(zetavec*wn,4./(zetavec*wn),'b','LineWidth',2,'DisplayName','4/a');
print("../../img/"+"lec4_plot2.eps",'-depsc','-r150');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wnvec=1:5;
zeta=0.6;

tsvec=zeros(size(wnvec));

for i=1:length(wnvec)
    wnval=wnvec(i);
    Gs=tf(wn^2,[1 2*zeta*wnval wnval^2]);
    info=stepinfo(Gs);
    tsvec(i)=info.SettlingTime;
end

figure(3);clf;hold on;grid minor;
set(gca,'MinorGridColor','k','MinorGridAlpha',1);
xlabel("\zeta w_n");ylabel("t_s");legend("show");
plot(wnvec*zeta,tsvec,'k','LineWidth',2,'DisplayName','stepinfo');
plot(wnvec*zeta,4./(zeta*wnvec),'b','LineWidth',2,'DisplayName','4/a');

print("../../img/"+"lec4_plot3.eps",'-depsc','-r150');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wn=2;
zetavec=0.1:0.1:1;

osvec=zeros(size(zetavec));

for i=1:length(zetavec)
    zetaval=zetavec(i);
    Gs=tf(wn^2,[1 2*zetaval*wn wn^2]);
    info=stepinfo(Gs);
    osvec(i)=info.Overshoot;
end

figure(2);clf;hold on;grid minor;
set(gca,'MinorGridColor','k','MinorGridAlpha',1);
xlabel("\zeta");ylabel("asim");legend("show");
plot(zetavec,osvec,'k','LineWidth',2,'DisplayName','stepinfo');
plot(zetavec,100*exp(-pi*zetavec./sqrt(1-zetavec.^2)),'b','LineWidth',2,'DisplayName','100e^{-pi\\zeta/\\sqrt{1-\\zeta^2}}');

print("../../img/"+"lec4_plot4.eps",'-depsc','-r150');