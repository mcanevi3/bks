clear;clc;

T=0.2;
Gz=tf(1,conv(conv([1 0.1],[1 0.8]),[1 -0.5]),T);
n=length(Gz.Denominator{:})-1;

kvec=0.1:0.1:10;
poles=zeros(n,length(kvec));

for i=1:length(kvec)
    kval=kvec(i);
    Tz=feedback(kval*Gz,1);
    den=Tz.Denominator{:};
    poles(:,i)=roots(den);
end

figure(1);clf;hold on;grid on;set(gca,'MinorGridColor','k','MinorGridAlpha',1);
xlabel("Re");ylabel("Im");
for i=1:n
    plot(real(poles(i,:)),imag(poles(i,:)),'x','LineWidth',2);
end
rectangle('Position',[-1,-1,2,2],'Curvature',[1 1]);
axis equal;
print("../../img/"+"lec5_rlocus1.eps",'-depsc','-r150');
