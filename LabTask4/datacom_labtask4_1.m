% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 4
% Title: Study of Nyquist bit rate and Shannon capacity using MATLAB
% Class Task for Lab Report
close all;
clc;

fs = 8000; % Sampling frequency
t = 0:1/fs:1-1/fs; %time array
signal = 1.5*sin(2*pi*2*t)+0.9*cos(2*pi*10*t)+1.1*sin(2*pi*20*t) ; %signal
noise = 0.13*randn(size(t)); %noise
noisy_signal = signal+noise;% noisy signal
%power of any array = average of squared value of each element of the array
power_signal = sum(signal.^2)/length(signal); %signal power
power_noise = sum(noise.^2)/length(noise); %noise power

SNR = snr(signal,noise); %Calculation of SNR using snr function (in dB)
defSNR = 10*log10(power_signal/power_noise); %Calculation of SNR following the definition (in dB)
