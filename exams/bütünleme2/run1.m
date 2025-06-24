clear;clc;

os=25.38/100;

syms s;
zeta=-log(os)/sqrt(pi^2+log(os)^2);
syms wn real;
pds=s^2+2*zeta*wn*s+wn^2;

zeta
% Gs=1/(s^2+4*s+3);
% syms k real;
% Ts=(k*Gs)/(1+k*Gs);
% [pzs,pcs]=numden(Ts);

% prob=coeffs(pcs,s,'all')==coeffs(pds,s,'all');
% for i=1:length(prob)
%     disp(prob(i))
% end
% sol=solve(prob);
% kval=double(sol.k);
% wnval=double(sol.wn);
% disp("k:"+string(kval));
% disp("wn:"+string(wnval));

% Fs=kval;
% [num,den]=numden(Gs);
% Gs=tf(double(coeffs(num,s,'all')),double(coeffs(den,s,'all')));
% Ts=feedback(Fs*Gs,1);
% Ts
% stepinfo(Ts)

