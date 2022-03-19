% Shadril Hassan Shifat
% ID: 20-42451-1
% Data Communication Lab - Mid Term Assignment(1)
% ID = AB-CDEFG-H

clc;
clear all;
close all;
%ID= 20-42451-1
A=2;
B=0;
C=4;
D=2;
E=4;
F=5;
G=1;
H=1;

a1=G+2;
a2=G+1;
f1=G+4;
f2=G+6;

fs = 1000; %sampling frequency
t = 0:1/fs:1; % time array

sig_ct = a1*sin(2*pi*f1*t) + a2*cos(2*pi*f2*t);%original signal
%quantization using matlab built-in quantiz() 
p= linspace(-3.75,3.75,7);
c= linspace(-5,5,8); %
[i,q]= quantiz(sig_ct,p,c);
%plot
plot(t,sig_ct,'*','linewidth',1.5);
hold  on;
plot(t,q,'x','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('quantization of signal sig_-ct using quantiz()');
legend('signal sig_-ct','quantized signal sig_-ct');