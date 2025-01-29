clear;clc;

ms=2.5;
mus=1;
ks=900;
kus=1250;
bs=7.5;
bus=5;

T=1e-3;

A=[
    1,T,0,-T;
    -ks*T/ms,(ms-bs*T)/ms,0,bs*T/ms;
    0,0,1,T;
    ks*T/mus,bs*T/mus,-kus*T/mus,(mus-bs*T-bus*T)/mus;
];
Bw=[0;0;-T;bus*T/mus];
Bu=[0;T/ms;0;-T/mus];

t=0:T:1;
w=0.04*sin(2*pi*10*t);

x1=zeros(size(t));
x2=zeros(size(t));
x3=zeros(size(t));
x4=zeros(size(t));
for i=2:length(t)
    temp=A*[x1(i-1);x2(i-1);x3(i-1);x4(i-1)]+Bw*w(i-1);
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