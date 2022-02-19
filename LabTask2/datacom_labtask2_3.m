% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 2
% Title: Study of signal frequency, spectrum, bandwidth, and quantization using MATLAB
% Performance Task for Lab Report
% ID = AB-CDEFG-H

clc;
clear all;
close all;

A=2;
B=0;
C=4;
D=2;
E=4;
F=5;
G=1;
H=1;

a1= A+C+1;
a2= A+D+2;
a3= A+E+1;
f1= A+E+1;
f2= A+D+2;
f3= A+C+1;

fs = 1000; %sampling frequency
t = 0:1/fs:1; % time array

x1= a1*cos(2*pi*f1*t);
x2= a2*sin(2*pi*f2*t);
x3 = a3*cos(2*pi*f3*t);
signal_x= x1+x2+x3;

% Question (b)
p= linspace(-15,15,7);
c= linspace(-20,20,8);
[i,q]= quantiz(signal_x,p,c);

plot(t,signal_x,'*',t,q,'x','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('quantization using quantiz() of signal x');
legend('signal x','quantized signal x');