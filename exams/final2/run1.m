clear;clc;

z=sym('z');
kp=sym('kp','real');
ki=sym('ki','real');

Gzz=1/(z+1.2);
Fzz=(ki*z+kp)/(z-1);
Tzz=(Fzz*Gzz)/(1+Fzz*Gzz);
[nz,dz]=numden(Tzz);
coef_num=coeffs(nz,z,'all');
coef_den=coeffs(dz,z,'all');
coef_num=coef_num/coef_den(1);
coef_den=coef_den/coef_den(1);

disp("num:");disp(coef_num);
disp("den:");disp(coef_den);

ts=4;
os=16.3/100;

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);
zeta=round(zeta,2);
wn=round(wn,2);

disp("zeta:"+string(zeta));
disp("wn:"+string(wn));
sval=-zeta*wn+1i*sqrt(1-zeta^2)*wn;
disp("s:"+string(sval));

T=0.5;
zval=exp(sval*T);
disp("z:"+string(zval));

pdz=(z-zval)*(z-conj(zval));
pdz=collect(pdz,z);
disp("p(z):");
disp(vpa(pdz,4));

prob=coeffs(pdz,z,'all')==coef_den;
disp("prob:");
for i=1:length(prob)
    disp(vpa(prob(i),4));
end

sol=solve(prob);
kpval=double(sol.kp);
kival=double(sol.ki);
disp("kp:"+string(kpval));
disp("ki:"+string(kival));

Fz=tf([kival kpval],[1 -1]);
Gz=tf(1,[1 1.2]);
Tz=feedback(Fz*Gz,1);
Fz
zpk(Fz)
Tz
zpk(Tz)
