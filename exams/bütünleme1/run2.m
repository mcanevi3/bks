clear;clc;
T=1;
A=[0.5,0;0,0.4];
B=[0;1];
C=[1,0];

z=sym('z');
pdz=z^2+0.5*z+0.25;
pdA=A*A+0.5*A+0.25*eye(2);
disp("pdA:");
disp(pdA);

phi=[B,A*B];
disp("phi:");
disp(phi);
K=-[0,1]*inv(phi)*pdA;
disp("K:");
disp(K);

K=[1,1];
lambda=eig(A+B*K);
lambda