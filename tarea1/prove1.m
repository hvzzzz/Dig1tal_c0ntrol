clc;clear all; close all;
A=[0 -0.16;1 -1]
B=[0;1]
D=[0 1]
% A=1e-6*[-73.81 2.58 0 0 0;1.88 -75.55 1.88 0 0;0 1.88 -75.55 1.88 0;0 0 1.88 -75.55 1.88;0 0 0 1.59 -24.36]
% B=[0.01361 0 0 0 0;0 0.02723 0 0 0;0 0 0.02723 0 0;0 0 0 0.02723 0;0 0 0 0 0.00689]
% D=eye(5)
%p=[-2+4i -2-4i -1+5i -1-5i -0.5];
p=[0.5+0.5i 0.5-0.5i]
k=place(A,D',p)
syms z k k11 k21;
caract=children(collect((z-(0.5+0.5i))*(z-(0.5-0.5i))));
k=[k11;k21];
error=z*eye(2)-(A-k*D);
pol=children(collect(det(error)));
eqns=[caract(1)==pol(1),caract(2)==pol(2),caract(3)==pol(3)];
[k11 k21] = solve(eqns,[k11 k21])

