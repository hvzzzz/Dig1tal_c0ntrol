%%
%%Pregunta_1
fprintf('Pregunta_1');
A=[0 1 0;0 0 1;-0.6 -0.7 -0.5];
B=[1;0;0];
D=[1 0 0];
E=[0];
L1=[D;D*A;D*A^2]
rank(L1)
%%
%%Pregunta_2
fprintf('Pregunta_2');
A=[0 1 0;0 0 1;-1 -2 -3];
B=[0 0;0 1;1 0];
D=[0 1 0;1 0 1];
E=[0];
L1=[D;D*A;D*A^2]
rank(L1)