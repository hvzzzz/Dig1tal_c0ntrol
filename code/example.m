clc;clear all; close all;
A=1e-6*[-73.81 2.58 0 0 0;1.88 -75.55 1.88 0 0;0 1.88 -75.55 1.88 0;0 0 1.88 -75.55 1.88;0 0 0 1.59 -24.36]
B=[0.01361 0 0 0 0;0 0.2723 0 0 0;0 0 0.2723 0 1;0 0 0 0.2723 0;0 0 0 0 0.00689]
D=eye(5)
fprintf('Matriz de Controlabilidad\n')
fprintf('El rango es:');
controlab=ctrb(A,B)
rank(ctrb(A,B))
fprintf('Matriz de Observabilidad\n')
observ=obsv(A,D)
fprintf('El rango es:');
rank(obsv(A,B))
if rank(obsv(A,B))& rank(ctrb(A,B))
    fprintf('El sistema es Controlable y Observable\n'); 
end
fprintf('C');
p=[-2+4i -2-4i -1+5i -1-5i -0.5];
%k=place(A,D,p);
syms s l1 l2 l3;
pol=children(collect(det([s 0 10+l1;s])))