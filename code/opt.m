clc;clear all;close all;
syms z p11 p12 p22 x1 x2;
%A=[0.5 0;0 0.2];
%B=[1;1];
A=[0 0.81;1 0];
B=[0;1];
p=[p11 p12;p12 p22];
eqn=A.'*p*A-p
%eqns=[eqn(1,1)==-1,eqn(2,2)==-1,eqn(3,3)==-1,eqn(2,1)==0,eqn(3,1)==0,eqn(2,3)==0]
eqns=[eqn(1,1)==-1,eqn(2,2)==-1,eqn(1,2)==0];
S=solve(eqns,[p11,p12,p22]);
P=[S.p11 S.p12;S.p12 S.p22]
x=[x1;x2];
V=x.'*P*x;
%simplify(V);
fprintf('V=\n');
pretty(simplify(V))
G=inv(B.'*P*B)*B.'*P*(A-eye(2))
expand(G);
u=-G*x;
pretty(u);
%V=x3^2*19/78+x2^2+x1^2
%V=(19*x1^2)/78 + (49*x2^2)/78 + (121*x3^2)/26 - (20*x1*x2)/39 - x1*x3 - (38*x2*x3)/13;  
%V=-1*V;
%G=A*x;
%x11=G(1,1);x22=G(2,1);
%energy=subs(V,[x1,x2],[x11,x22])-V;
%fprintf('function=\n');
%pretty(simplify(energy));
