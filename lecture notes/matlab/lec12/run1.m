clear;clc;

syms z;
A=[1,0.1;-0.1,0.95];
B=[0;0.1];
C=[1,0];

phic=[B,A*B];

ts=1;
os=10/100;
T=0.1;

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);
poles_s=[-zeta*wn+1i*wn*sqrt(1-zeta^2),-zeta*wn-1i*wn*sqrt(1-zeta^2)];
poles_z=exp(poles_s*T);

pdz=prod(z-poles_z);
pdz=expand(pdz);

disp("pdz:"+string(vpa(pdz,4)));
coef=double(coeffs(pdz,z,'all'));
pdA=coef(1)*A*A+coef(2)*A+coef(3)*eye(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms k1 k2 real;
K=[k1 k2];
pcz=det(z*eye(2)-(A+B*K));
pcz=collect(pcz,z);
disp("pcz:"+string(vpa(pcz,4)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kval=-[0 1]*inv(phic)*pdA;
disp("K:"+string(num2str(Kval)));

lambda=eig(A+B*Kval);
disp("lambda:"+string(num2str(lambda')));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mdl="model1";
fname="../../img/lec12_"+mdl+".pdf";
open_system(mdl);
print(fname,'-dpdf','-bestfit',"-s"+mdl);
close_system(mdl);
dos("pdfcrop "+fname+" "+fname+" &");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

T=0.1;
t=0:T:5;
r=ones(size(t));
u=zeros(size(t));
x1=zeros(size(t));
x2=zeros(size(t));
y=zeros(size(t));

for k=2:length(t)
    u(k-1)=Kval(1)*x1(k-1)+Kval(2)*x2(k-1)+r(k-1);
    x1(k)=x1(k-1)+0.1*x2(k-1);
    x2(k)=-0.1*x1(k-1)+0.95*x2(k-1)+0.1*u(k-1);
    y(k-1)=x1(k-1);
end

figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");ylabel("x_1(k),x_2(k)");title("Durum uzayı yanıtı");
legend("show");
stem(t,r,'k','LineWidth',2,'DisplayName','r(k)');
stem(t,y,'b','LineWidth',2,'DisplayName','y(k)');
print("../../img/"+"lec12_plot1.eps",'-depsc','-r150');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r=ones(size(t));
u=zeros(size(t));
x1=zeros(size(t));
x2=zeros(size(t));
y=zeros(size(t));

for k=2:length(t)
    u(k-1)=Kval(1)*x1(k-1)+Kval(2)*x2(k-1)+r(k-1);
    x1(k)=x1(k-1)+0.1*x2(k-1);
    x2(k)=-0.1*x1(k-1)+0.95*x2(k-1)+0.1*u(k-1);
    y(k-1)=x1(k-1);
end

figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");ylabel("x_1(k),x_2(k)");title("Durum uzayı yanıtı");
legend("show");
stem(t,r,'k','LineWidth',2,'DisplayName','r(k)');
stem(t,y,'b','LineWidth',2,'DisplayName','y(k)');
print("../../img/"+"lec12_plot1.eps",'-depsc','-r150');



