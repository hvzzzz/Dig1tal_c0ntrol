clc;clear all;close all;
syms z p11 p12 p13 p22 p23 p33 x1 x2 x3;
%A=[0 1;-0.5 -1]
%A=[1 -1.2;0.5 0];
A=[1 3 0;-3 -2 -3;1 0 0];
%p=[p11 p12;p12 p22];
p=[p11 p12 p13;p12 p22 p23;p13 p23 p33];
eqn=A.'*p*A-p
eqns=[eqn(1,1)==-1,eqn(2,2)==-1,eqn(3,3)==-1,eqn(2,1)==0,eqn(3,1)==0,eqn(2,3)==0]
%eqns=[eqn(1,1)==-1,eqn(2,2)==-1,eqn(1,2)==0];
S=solve(eqns,[p11,p12,p13,p22,p23,p33]);
%S=solve(eqns,[p11,p12,p22]);
P=[S.p11 S.p12 S.p13;S.p12 S.p22 S.p23;S.p13 S.p23 S.p33]
%P=-1*P
%P=[S.p11 S.p12;S.p12 S.p22];
x=[x1;x2;x3];
%x=[x1;x2];
V=x.'*P*x;
%simplify(V);
fprintf('V=\n')
pretty(simplify(V))
%V=x3^2*19/78+x2^2+x1^2
%V=(19*x1^2)/78 + (49*x2^2)/78 + (121*x3^2)/26 - (20*x1*x2)/39 - x1*x3 - (38*x2*x3)/13;  
%V=-1*V;
G=A*x;
x11=G(1,1);x22=G(2,1);x33=G(3,1);
energy=subs(V,[x1,x2,x3],[x11,x22,x33])-V;
fprintf('function=\n')
pretty(simplify(energy))
