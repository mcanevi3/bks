clear;clc;

ms=2.5;
mus=1;
ks=900;
kus=1250;
bs=7.5;
bus=5;

T=1e-3;

% A=[
%     0,1,0,-1;
%     -ks/ms,-bs/ms,0,bs/ms;
%     0,0,0,1;
%     ks/mus,bs/mus,-kus/mus,-(bs+bus)/mus;
% ];
% Bu=[0;1/ms;0;-1/mus];
% Q=diag([450 30 5 0.01]);
% R=0.01;
% K=-lqr(A,Bu,Q,R);

% s=eig(A+Bu*K);
% poles_z=exp(s*T);
poles_z=[0.95,0.92,0.94,0.98];
disp("z:");
disp(poles_z);

A=[
    1,T,0,-T;
    -ks*T/ms,(ms-bs*T)/ms,0,bs*T/ms;
    0,0,1,T;
    ks*T/mus,bs*T/mus,-kus*T/mus,(mus-bs*T-bus*T)/mus;
];
Bw=[0;0;-T;bus*T/mus];
Bu=[0;T/ms;0;-T/mus];


syms z;
pdz=prod(z-poles_z);
disp("pd(z):");
disp(vpa(collect(pdz),4));
coef=double(coeffs(pdz,z,'all'));

pdA=coef(1)*A*A*A*A+coef(2)*A*A*A+coef(3)*A*A+coef(4)*A+coef(5)*eye(4);
disp("pdA:");
disp(vpa(round(pdA,4),6));

phi=[Bu,A*Bu,A*A*Bu,A*A*A*Bu];
disp("phi:");
disp(vpa(round(phi,4),6));

disp("phi^{-1}:");
disp(inv(phi));

K=-[0,0,0,1]*inv(phi)*pdA;
disp("K:");
disp(vpa(round(K,4),6))

disp("eig:");
disp(eig(A+Bu*K));


t=0:T:1;
w=0.04*sin(2*pi*10*t);
u=zeros(size(t));
x1=zeros(size(t));
x2=zeros(size(t));
x3=zeros(size(t));
x4=zeros(size(t));
for i=2:length(t)
    u(i-1)=K*[x1(i-1);x2(i-1);x3(i-1);x4(i-1)];
    temp=A*[x1(i-1);x2(i-1);x3(i-1);x4(i-1)]+Bw*w(i-1)+Bu*u(i-1);
    x1(i)=temp(1);
    x2(i)=temp(2);
    x3(i)=temp(3);
    x4(i)=temp(4);
end

figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
legend("show");xlabel("Zaman(s)");title("Aktif süspansiyon verileri")
plot(t,x1,'r','LineWidth',2,'DisplayName','x_1');
plot(t,x2,'b','LineWidth',2,'DisplayName','x_2');
plot(t,x3,'m','LineWidth',2,'DisplayName','x_3');
plot(t,x4,'c','LineWidth',2,'DisplayName','x_4');
print("plot1.eps",'-depsc','-r150');

%%% open loop
t=0:T:1;
uo=zeros(size(t));
x1o=zeros(size(t));
x2o=zeros(size(t));
x3o=zeros(size(t));
x4o=zeros(size(t));
for i=2:length(t)
    temp=A*[x1o(i-1);x2o(i-1);x3o(i-1);x4o(i-1)]+Bw*w(i-1)+Bu*uo(i-1);
    x1o(i)=temp(1);
    x2o(i)=temp(2);
    x3o(i)=temp(3);
    x4o(i)=temp(4);
end


figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
legend("show");xlabel("Zaman(s)");title("Aktif süspansiyon verileri x_1")
plot(t,x1o,'k','LineWidth',2,'DisplayName','açık çevrim');
plot(t,x1,'r','LineWidth',2,'DisplayName','kapalı çevrim');
print("plot2.eps",'-depsc','-r150');

figure(2);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
legend("show");xlabel("Zaman(s)");title("Aktif süspansiyon verileri x_2")
plot(t,x2o,'k','LineWidth',2,'DisplayName','açık çevrim');
plot(t,x2,'r','LineWidth',2,'DisplayName','kapalı çevrim');
print("plot3.eps",'-depsc','-r150');

figure(3);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
legend("show");xlabel("Zaman(s)");title("Aktif süspansiyon verileri x_3")
plot(t,x3o,'k','LineWidth',2,'DisplayName','açık çevrim');
plot(t,x3,'r','LineWidth',2,'DisplayName','kapalı çevrim');
print("plot4.eps",'-depsc','-r150');

figure(4);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
legend("show");xlabel("Zaman(s)");title("Aktif süspansiyon verileri x_4")
plot(t,x4o,'k','LineWidth',2,'DisplayName','açık çevrim');
plot(t,x4,'r','LineWidth',2,'DisplayName','kapalı çevrim');
print("plot5.eps",'-depsc','-r150');
