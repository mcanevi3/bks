clear;clc;

T=1;

figure(1);clf;
subplot(1,2,1);cla;hold on;ax1=gca;
subplot(1,2,2);cla;hold on;ax2=gca;

thetavec=0:12:360;
for i=1:length(thetavec)
    theta=thetavec(i);
    color=i/length(thetavec);
    z=cosd(theta)+1i*sind(theta);
    p=log(z)/T;
    
    plot(ax1,real(p),imag(p),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z),imag(z),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
end

xlim(ax1,[-1 0.2]);plot(ax1,[-1 0.2],[0 0],'k--');
ylim(ax1,[-3.5 3.5]);plot(ax1,[0 0],[-4 4],'k--');
xlim(ax2,[-1.1 1.1]);
ylim(ax2,[-1.1 1.1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2);clf;
subplot(1,2,1);cla;hold on;ax1=gca;
subplot(1,2,2);cla;hold on;ax2=gca;

thetavec=0:12:360;
for i=1:length(thetavec)
    theta=thetavec(i);
    color=i/length(thetavec);
    z=0.8*cosd(theta)+0.8*1i*sind(theta);
    p=log(z)/T;
    
    plot(ax1,real(p),imag(p),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z),imag(z),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
end

xlim(ax1,[-1 0.2]);plot(ax1,[-1 0.2],[0 0],'k--');
ylim(ax1,[-3.5 3.5]);plot(ax1,[0 0],[-4 4],'k--');
xlim(ax2,[-1.1 1.1]);
ylim(ax2,[-1.1 1.1]);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3);clf;
subplot(1,2,1);cla;hold on;ax1=gca;
subplot(1,2,2);cla;hold on;ax2=gca;

thetavec=0:12:360;
for i=1:length(thetavec)
    theta=thetavec(i);
    color=i/length(thetavec);
    z=0.2*cosd(theta)+0.2*1i*sind(theta);
    p=log(z)/T;
    
    plot(ax1,real(p),imag(p),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
    plot(ax2,real(z),imag(z),'x','Color',[color,0,0],'LineWidth',3,'MarkerSize',12);
end

xlim(ax1,[-2 0.2]);plot(ax1,[-2 0.2],[0 0],'k--');
ylim(ax1,[-3.5 3.5]);plot(ax1,[0 0],[-4 4],'k--');
xlim(ax2,[-1.1 1.1]);
ylim(ax2,[-1.1 1.1]);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);

