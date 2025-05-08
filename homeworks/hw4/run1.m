clear;clc;

ts=2;
os=5/100;

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);


J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;
s = tf('s');
Gs = K/((J*s+b)*(L*s+R)+K^2);

num=Gs.Numerator{:};
den=Gs.Denominator{:};

syms s;
syms kd kp ki real;
Gss=(num(1)*s^2+num(2)*s+num(3))/(den(1)*s^2+den(2)*s+den(3));
Fss=(kd*s^2+kp*s+ki)/s;
Tss=(Fss*Gss)/(1+Fss*Gss);
Tss=simplify(Tss);

[pzs,pcs]=numden(Tss);
coef=coeffs(pcs,s,'all');
coef=coef/coef(1);

pds=s^2+2*zeta*wn*s+wn^2;
syms p real;
pes=s+p;
pol=pds*pes;

prob=coef==coeffs(pol,s,'all');
for i=1:length(prob)
    disp(vpa(prob(i),4));
end
sol=solve(prob,[kd,ki,p]);

pzs=sol.kd*s^2+kp*s+sol.ki;
pes=s+sol.p;

temp=coeffs(pzs,kp,'all');
Gzs=tf(double(coeffs(temp(1),s,'all')),double(coeffs(temp(2),s,'all')));

% figure(1);clf;
% rlocus(Gzs);

kpval=15.6;
kdval=double(subs(sol.kd,kp,kpval));
kival=double(subs(sol.ki,kp,kpval));
pval=double(subs(sol.p,kp,kpval));

Fs=tf([kdval kpval kival],[1 0]);
Ts=feedback(Fs*Gs,1);
zpk(Ts)

disp("kd:"+string(kdval)+" "+"kp:"+string(kpval)+" "+"ki:"+string(kival))
figure(1);clf;hold on;grid on;
[y,t]=step(Ts);
info=stepinfo(Ts);
title("Step Response os:"+string(info.Overshoot)+" ts:"+string(info.SettlingTime));
plot(t,y*100,'b','LineWidth',2);
xlabel("time(s)");ylabel("Speed (rad/sn)");
print("motor_step.png","-dpng","-r250")