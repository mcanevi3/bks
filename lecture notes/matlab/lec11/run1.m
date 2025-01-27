clear;clc;

% mdl="model1";
% fname="../../img/"+mdl+".pdf";
% open_system(mdl);
% print(fname,'-dpdf','-bestfit',"-s"+mdl);
% close_system(mdl);
% dos("pdfcrop "+fname+" "+fname+" &");

T=0.1;
t=0:T:5;
u=0.1*sin(4*t);
x1=zeros(size(t));
x2=zeros(size(t));
y=zeros(size(t));

for k=2:length(t)
    x1(k)=x1(k-1)+0.1*x2(k-1);
    x2(k)=-0.1*x1(k-1)+0.95*x2(k-1)+0.1*u(k-1);
    y(k-1)=x1(k-1);
end

figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
xlabel("Zaman(s)");ylabel("x_1(k),x_2(k)");title("Durum uzayı yanıtı");
legend("show");
stem(t,x1,'r','LineWidth',2,'DisplayName','x_1(k)');
stem(t,x2,'b','LineWidth',2,'DisplayName','y(k),x_2(k)');
print("../../img/"+"lec11_plot1.eps",'-depsc','-r150');

% mdl="model2";
% fname="../../img/"+mdl+".pdf";
% open_system(mdl);
% print(fname,'-dpdf','-bestfit',"-s"+mdl);
% close_system(mdl);
% dos("pdfcrop "+fname+" "+fname+" &");

