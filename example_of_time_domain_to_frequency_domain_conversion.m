%Example of time domain to frequency domain conversion 

clc
clear all
close all

fs = 1000; %sampling frequency
t = 0:1/fs:2; % time array
x1 = 2*sin(2*pi*3*t);
x2 = 1.5*cos(2*pi*5*t);
x3 = 4*sin(2*pi*9*t);
x = x1 + x2 + x3;
% this is in time time domain
% it has three frequency components.
% the frequency components are 3 Hz, 5 Hz, and 9 Hz

figure
plot(t,x,'linewidth',1.5)
xlabel('time')
ylabel('amplitude')
title('example of time domain representation')

% we will do frequency conversion below
fx = abs(fftshift(fft(x)))/(length(x)/2); % freq domain representation
freq = linspace(-fs/2, fs/2, length(x));

figure
bar(freq, fx,'linewidth',1)
xlim([-15 +15])
xlabel('frequency')
ylabel('amplitude')
title('example of frequency domain representation')