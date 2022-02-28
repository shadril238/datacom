% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 2
% Title: Analog Signal quantization using MATLAB
% Performance Task for Lab Report (Method - 2)
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

fs= 50000;
t=0:1/fs:0.1;
xt= (H+5)*cos(2*pi*((D+E+5)*10)*t) + (H+7)*sin(2*pi*((E+F+10)*10)*t);

%quantization
level=12-2^H;
delta= (max(xt)-min(xt))/(level-1);
xq=min(xt)+(round((xt-min(xt))/delta)).*delta;

%plotting
plot(t,xt,'r-.', 'linewidth',1.5);
hold on;
plot(t,xq,'k-.', 'linewidth',1.5);

xlabel('time');
ylabel('amplitude');
title('example of manual quantization method 1');
legend('Original signal','quantized signal');
