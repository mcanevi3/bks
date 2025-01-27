clear;clc;

ts=2;
os=20/100;

zeta=-log(os)/sqrt(pi^2+log(os)^2);
wn=4/(ts*zeta);
T=0.5;
pds=[1 2*zeta*wn wn^2];
s=roots(pds);
z=exp(s*T);

pdz=[1 -z(1)-z(2) z(1)*z(2)];

disp("zeta:"+string(zeta));
disp("wn:"+string(wn));
disp("s:"+string(num2str(s')));
disp("p(s):"+string(num2str(pds)));
disp("z:"+string(num2str(z')));
disp("p(z):"+string(num2str(pdz)));

Gz=tf(1,pdz,T);
[yz,tz]=step(Gz);
stem(tz,yz)

