clear all; close all; clc;
P=0;P(11)=1;K=0;x=0;x(1)=1;u=0;
for i=10:-1:1
    P(i)=1+0.1354*P(i+1)*inv(1+0.3996*P(i+1));
end
for i=11:-1:1
    K(i)=0.6321*inv(0.3679)*(P(i)-1);
end
for i=1:10
    x(i+1)=(0.3679-0.6321*K(i))*x(i);
end
for i=1:11
    u(i)=-K(i)*x(i);
end
figure(1)
subplot(2,2,1);stem(0:10,P);ylabel("P(k)");xlabel("k");
subplot(2,2,2);stem(0:10,K);ylabel("K(k)");xlabel("k");
subplot(2,2,3);stem(0:10,x);ylabel("x(k)");xlabel("k");
subplot(2,2,4);stem(0:10,u);ylabel("u(k)");xlabel("k");
