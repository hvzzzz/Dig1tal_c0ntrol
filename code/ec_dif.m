clc;clear all;close all;
N=10; 
n=0:N-1;
x1=zeros(1,N);
x2=zeros(1,N);
x3=zeros(1,N);
x1(1)=1;
x2(1)=1;
x3(1)=1;
for i=1:N-1 
%    x1(i+1)=x2(i);
%    x2(i+1)=-0.5*x1(i)-x2(i);
     x1(i+1)= x2(i);
     x2(i+1)= x3(i);
     x3(i+1)= -200*x1(i)-60*x2(i)-14*x3(i);
end
figure(1);
subplot(3,1,1);
stem(n,x1);
subplot(3,1,2);
stem(n,x2);
subplot(3,1,3);
stem(n,x3);
print("pr.pdf")
%print(hv,"prove.pdf","-dpdflatexstandalone");
%system("pdflatex prove");
