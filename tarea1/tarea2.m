clc;clear all; close all;
A=1e-6*[-73.81 2.58 0 0 0;1.88 -75.55 1.88 0 0;0 1.88 -75.55 1.88 0;0 0 1.88 -75.55 1.88;0 0 0 1.59 -24.36]
B=[0.01361 0 0 0 0;0 0.2723 0 0 0;0 0 0.2723 0 1;0 0 0 0.2723 0;0 0 0 0 0.00689]
D=eye(5)
fprintf('Matriz de Controlabilidad\n')
controlab=ctrb(A,B)
fprintf('El rango es:');
rank(ctrb(A,B))
