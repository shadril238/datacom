%Importance of frequency domain analysis for noise reduction

clc
clear all
close all

fs = 1000; %sampling frequency
t = 0:1/fs:2; % time array
x1 = 2*sin(2*pi*3*t);
x2 = 1.5*cos(2*pi*5*t);
x3 = 4*sin(2*pi*9*t);
x = x1 + x2 + x3; %audio signal
%noise
noise = 1.5*randn(size(x));
noisy_signal = x + noise;
% this is in time domain
% it has three frequency components.
% the frequency components are 3 Hz, 5 Hz, and 9 Hz
figure
plot(t,x,'linewidth',1.5)
xlabel('time')
ylabel('amplitude')
title('original signal')
figure
plot(t,noise,'linewidth',1.5)
xlabel('time')
ylabel('amplitude')
title('noise')
figure
plot(t,noisy_signal,'linewidth',1.5)
xlabel('time')
ylabel('amplitude')
title('noisy signal')

% we will do frequency conversion below
fx = abs(fftshift(fft(x)))/(length(x)/2); % original signal in FD
f_noise = abs(fftshift(fft(noise)))/(length(x)/2); % noise in FD
f_noisy_signal = abs(fftshift(fft(noisy_signal)))/(length(x)/2); % noisy signal in FD
freq = linspace(-fs/2, fs/2, length(x));

figure
bar(freq, fx,'linewidth',1)
xlim([-15 +15])
xlabel('frequency')
ylabel('amplitude')
title('original signal in FD')
figure
bar(freq, f_noise,'linewidth',1)
xlim([-15 +15])
xlabel('frequency')
ylabel('amplitude')
title('noise in FD')
figure
bar(freq, f_noisy_signal,'linewidth',1)
xlim([-15 +15])
xlabel('frequency')
ylabel('amplitude')
title('noisy signal in FD')