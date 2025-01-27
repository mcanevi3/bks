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

K=-[0 1]*inv(phic)*pdA;
disp("K:"+string(num2str(K)));

lambda=eig(A+B*K);
disp("lambda:"+string(num2str(lambda')));
