clear all; close all; clc;
G=[0 1;-0.5 1];H=[1;1];Q=eye(2);R=1;S=eye(2);
P.p1=zeros(2);;P.p2=zeros(2);P.p3=zeros(2);P.p4=zeros(2);P.p5=zeros(2);P.p6=zeros(2);P.p7=zeros(2);P.p8=zeros(2);P.p9=eye(2);
K.k1=zeros(1,2);K.k2=zeros(1,2);K.k3=zeros(1,2);K.k4=zeros(1,2);K.k5=zeros(1,2);K.k6=zeros(1,2);K.k7=zeros(1,2);K.k8=zeros(1,2);K.k9=zeros(1,2);
x.x1=[2;2];x.x2=zeros(2,1);x.x3=zeros(2,1);x.x4=zeros(2,1);x.x5=zeros(2,1);x.x6=zeros(2,1);x.x7=zeros(2,1);x.x8=zeros(2,1);x.x9=zeros(2,1);
u=0;
for i=8:-1:1
    str=num2str(i);
    strp=strcat('p',str);
    strnext=num2str(i+1);
    strpnext=strcat('p',strnext);
    P.(strp)=Q+G'*P.(strpnext)*inv(eye(2)+H*inv(R)*H'*P.(strpnext))*G;
end
for i=9:-1:1
    str=num2str(i);
    strp=strcat('k',str);
    strp1=strcat('p',str);
    K.(strp)=inv(R)*H'*inv(G')*(P.(strp1)-Q);
end
for i=1:8
    str=num2str(i);
    strp=strcat('k',str);
    strp1=strcat('x',str);
    strnext=num2str(i+1);
    strpnext=strcat('x',strnext);
    x.(strpnext)=(G-H*K.(strp))*x.(strp1);
end
for i=1:9
    str=num2str(i);
    strp=strcat('k',str);
    strp1=strcat('x',str);
    u(i)=-K.(strp)*x.(strp1);
end
fprintf("La secuencia u(k) que minimiza el indice de desempenho es")
u(:)
