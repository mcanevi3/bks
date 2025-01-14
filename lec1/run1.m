clear;clc;

Gs=tf(1,conv([1 1],conv([1 0],[1 1 1])));
[poles,~]=pzmap(Gs);

Gs

for i=1:length(poles)
    p=poles(i);
end
