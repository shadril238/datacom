
% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 2
% Title: Study of signal frequency, spectrum, bandwidth, and quantization using MATLAB
% Class Task for Lab Report
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

a1= B+G+H;
a2= C+E+H;
f1= G+H+2;
f2= E+F+H;

fs = 1000; %sampling frequency
t = 0:1/fs:2; % time array

signal_x = a1*sin(2*pi*f1*t) + a2*cos(2*pi*f2*t);
% time domain representation
figure;
plot(t,signal_x,'b','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('time domain representation of signal x');
% frequency domain representation
fx = abs(fftshift(fft(signal_x)))/(length(signal_x)/2);
freq = linspace(-fs/2, fs/2, length(signal_x));
figure;
bar(freq, fx,'r','linewidth',1);
xlim([-15 +15]);
xlabel('frequency');
ylabel('amplitude');
title('frequency domain representation of signal x')
