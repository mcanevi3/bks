clear;clc;
T=0.2;
ts=1;
os=10/100;
zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);
zpoles=exp(T*roots([1 2*zeta*wn wn^2]));
coef=conv([1 -zpoles(1)],[1 -zpoles(2)]);
Gs=tf(1,[1 2]);
Gz=c2d(Gs,T,'zoh');
syms s z;
Gzz=0.1648/(z-0.6703);


syms kp ki kd real;
Fzz=((kp+ki+kd)*z^2-(kp+2*kd)*z+kd)/(z^2-z);
Tzz=(Fzz*Gzz)/(Fzz*Gzz+1);
[pzs,pcs]=numden(Tzz);
coef_pcs=coeffs(pcs,z,'all');
coef_pcs=coef_pcs/coef_pcs(1);
syms p real;
prob=coef_pcs==coeffs((coef(1)*s^2+coef(2)*s+coef(3))*(s+p),s,'all');
sol=solve(prob,[p kd ki]);

pval=sol.p;
kpmin=double(solve(pval==1));
kpmax=double(solve(pval==-1));

fun_p=matlabFunction(sol.p);
fun_kd=matlabFunction(sol.kd);
fun_ki=matlabFunction(sol.ki);

lenn=400;
kpvec=linspace(kpmin+0.1,kpmax-0.1,lenn);
tablo=zeros(lenn,6);
for i=1:lenn
    kpval=kpvec(i);
    kdval=fun_kd(kpval);
    kival=fun_ki(kpval);
    Fz=tf([kpval+kival+kdval -(kpval+2*kdval) kdval],[1 -1 0],T);
    Tz=feedback(Fz*Gz,1);
    info=stepinfo(Tz); 
    tsval=info.SettlingTime;
    osval=info.Overshoot/100;
    err=0.5*abs(ts-tsval)/ts+0.5*abs(os-osval)/os;
    tablo(i,:)=[kpval kival kdval tsval osval err];
end

[val,index]=min(tablo(:,end));
row=tablo(index,:);
kpval=row(1);
kival=row(2);
kdval=row(3);
tsval=row(4);
osval=row(5);
Fz=tf([kpval+kival+kdval -(kpval+2*kdval) kdval],[1 -1 0],T);
Tz=feedback(Fz*Gz,1);
Tz
zpk(Tz)
stepinfo(Tz)

[y,t]=step(Tz);
figure(1);clf;hold on;grid minor;set(gca, 'MinorGridColor', 'k','MinorGridAlpha',1);
stem(t,y,'k','LineWidth',2);
print("../../img/"+"lec10_step1.eps",'-deps','-r150');