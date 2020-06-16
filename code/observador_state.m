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
syms z k k11 k12 k13 k14 k15 k21 k22 k23 k24 k25 k31 k32 k33 k34 k35 k41 k42 k43 k44 k45 k51 k52 k53 k54 k55;
caract=children(collect((z-(-2+4i))*(z-(-2-4i))*(z-(-1+5i))*(z-(-1-5i))*(z-(-0.5))))
k=[k11 k12 k13 k14 k15;k21 k22 k23 k24 k25;k31 k32 k33 k34 k35;k41 k42 k43 k44 k45;k51 k52 k53 k54 k55];
error=z*eye(5)-(A-k*D)
pol=children(collect(det(error)))
eqns=[caract(1)==pol(1),caract(2)==pol(2),caract(3)==pol(3),caract(4)==pol(4),caract(5)==pol(5),caract(6)==pol(6)];
S = solve(eqns,[k11 k12 k13 k14 k15 k21 k22 k23 k24 k25 k31 k32 k33 k34 k35 k41 k42 k43 k44 k45 k51 k52 k53 k54 k55])
