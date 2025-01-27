clear;clc;
syms z;
A=[1,0.1;-0.1,0.95];
B=[0;0.1];
C=[1,0];

phic=[C;C*A];

T=0.1;


pdz=(z-0.1)*(z-0.1);
pdz=expand(pdz);

disp("pdz:"+string(vpa(pdz,4)));
coef=double(coeffs(pdz,z,'all'));
pdA=coef(1)*A*A+coef(2)*A+coef(3)*eye(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms l1 l2 real;
L=[l1;l2];
pcz=det(z*eye(2)-(A+L*C));
pcz=collect(pcz,z);
disp("pcz:"+string(vpa(pcz,4)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Lval=pdA*inv(phic)*[0;1];
disp("L^T:"+string(num2str(Lval')));

lambda=eig(A-Lval*C);
disp("lambda:"+string(num2str(lambda')));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mdl="model1";
fname="../../img/lec13_"+mdl+".pdf";
open_system(mdl);
print(fname,'-dpdf','-bestfit',"-s"+mdl);
close_system(mdl);
dos("pdfcrop "+fname+" "+fname+" &");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T=0.1;
t=0:T:10;
n=randn(size(t));n=n/sqrt(var(n));n=n-mean(n);
n=n*0.005;

u=ones(size(t));
x1=zeros(size(t));
x2=zeros(size(t));
y=zeros(size(t));
x1hat=zeros(size(t));
x2hat=zeros(size(t));
yhat=zeros(size(t));

for k=2:length(t)
    y(k-1)=x1(k-1)+n(k-1);
    x1(k)=x1(k-1)+0.1*x2(k-1);
    x2(k)=-0.1*x1(k-1)+0.95*x2(k-1)+0.1*u(k-1);
    
    yhat(k-1)=x1hat(k-1);
    x1hat(k)=x1hat(k-1)+0.1*x2hat(k-1)+Lval(1)*(y(k-1)-yhat(k-1));
    x2hat(k)=-0.1*x1hat(k-1)+0.95*x2hat(k-1)+0.1*u(k-1)+Lval(2)*(y(k-1)-yhat(k-1));
end

figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");ylabel("x_1(k),x_2(k)");title("Luenberger Gözleyici");
legend("show");
plot(t,x1,'k','LineWidth',2,'DisplayName','x_1(k)');
plot(t,x1hat,'bo','LineWidth',2,'DisplayName','x_{1o}(k)');
plot(t,x2,'k','LineWidth',2,'DisplayName','x_2(k)');
plot(t,x2hat,'ro','LineWidth',2,'DisplayName','x_{2o}(k)');
print("../../img/"+"lec13_plot1.eps",'-depsc','-r150');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%