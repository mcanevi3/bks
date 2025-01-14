clear;clc;

T=1;

wn=1;
thetavec=0:1:90;

figure(1);clf;
subplot(1,2,1);cla;hold on;ax1=gca;
subplot(1,2,2);cla;hold on;ax2=gca;

for i=1:length(thetavec)
    color=i/length(thetavec);
    zeta=cosd(thetavec(i));

    p=-zeta*wn+1i*sqrt(1-zeta^2)*wn;
    z1=exp(p*T);
    z2=exp(conj(p)*T);
    
    plot(ax1,real(p),imag(p),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax1,real(conj(p)),imag(conj(p)),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z1),imag(z1),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z2),imag(z2),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
end

xlim(ax2,[-1.1 1.1]);
ylim(ax2,[-1.1 1.1]);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wnvec=2:0.1:8;
zeta=0.7;
figure(2);clf;
subplot(1,2,1);cla;hold on;ax1=gca;
subplot(1,2,2);cla;hold on;ax2=gca;

for i=1:length(wnvec)
    color=i/length(wnvec);
    wn=wnvec(i);

    p=-zeta*wn+1i*sqrt(1-zeta^2)*wn;
    z1=exp(p*T);
    z2=exp(conj(p)*T);
    
    plot(ax1,real(p),imag(p),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax1,real(conj(p)),imag(conj(p)),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z1),imag(z1),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z2),imag(z2),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
end

xlim(ax2,[-1.1 1.1]);
ylim(ax2,[-1.1 1.1]);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
bvec=2:0.1:8;
a=-1;
figure(3);clf;
subplot(1,2,1);cla;hold on;ax1=gca;
subplot(1,2,2);cla;hold on;ax2=gca;

for i=1:length(bvec)
    color=i/length(bvec);
    b=bvec(i);

    p=a+1i*b;
    z1=exp(p*T);
    z2=exp(conj(p)*T);
    
    plot(ax1,real(p),imag(p),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax1,real(conj(p)),imag(conj(p)),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z1),imag(z1),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z2),imag(z2),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
end

xlim(ax2,[-1.1 1.1]);
ylim(ax2,[-1.1 1.1]);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
avec=2:0.1:8;
b=1;
figure(4);clf;
subplot(1,2,1);cla;hold on;ax1=gca;
subplot(1,2,2);cla;hold on;ax2=gca;

for i=1:length(avec)
    color=i/length(avec);
    a=avec(i);

    p=-a+1i*b;
    z1=exp(p*T);
    z2=exp(conj(p)*T);
    
    plot(ax1,real(p),imag(p),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax1,real(conj(p)),imag(conj(p)),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z1),imag(z1),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z2),imag(z2),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
end

xlim(ax2,[-1.1 1.1]);
ylim(ax2,[-1.1 1.1]);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
