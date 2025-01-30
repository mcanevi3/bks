clear;clc;

s=-1+1i;
fun=@(T)exp(s*T);

Tvec=logspace(-4,1,100);
figure(1);clf;hold on;grid on;
xlabel("Re");ylabel("Im");title("T'nin değişimine göre z");
plot(real(fun(Tvec)),imag(fun(Tvec)),'r','LineWidth',2);
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
axis equal;
print("plot1.eps",'-depsc','-r150');
