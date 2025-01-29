clear;clc;

col1=[1;4;3];
col2=[1;5;6];
col3=[1;3;2];

disp("*****************");
T=[col1,col2,col3];
disp("inv");disp(T);disp("=");disp(round(inv(T),1));

disp("*****************");
T=[col1,col3,col2];
disp("inv");disp(T);disp("=");disp(round(inv(T),1));

disp("*****************");
T=[col2,col1,col3];
disp("inv");disp(T);disp("=");disp(round(inv(T),1));

disp("*****************");
T=[col2,col3,col1];
disp("inv");disp(T);disp("=");disp(round(inv(T),1));

disp("*****************");
T=[col3,col1,col2];
disp("inv");disp(T);disp("=");disp(round(inv(T),1));

disp("*****************");
T=[col3,col2,col1];
disp("inv");disp(T);disp("=");disp(round(inv(T),1));

Gs=0.5*tf(1,[1 1])+0.5*tf(1,[1 3])-tf(1,[1 2]);
Gz=0.5*tf([1 0],[1 -exp(-1)],1)+0.5*tf([1 0],[1 -exp(-3)],1)-tf([1 0],[1 -exp(-2)],1)

