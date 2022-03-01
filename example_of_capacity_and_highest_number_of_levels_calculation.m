%Example of Capacity and highest number of Levels calculation:

clc;
close all;

fs = 10000; % sampling frequency
t = 0:1/fs:3;
amp1 = 9;
freq1 = 5;
amp2 = 15;
freq2 = 12;
sig = amp1*sin(2*pi*freq1*t) + amp2*cos(2*pi*freq2*t); % original signal
sd = 2.5; % standard deviation
noise = sd*randn(size(sig)); % noise

snr_function_dB = snr(sig, noise); % works both with simple and composite signal
%%% snr() returns SNR value in dB
snr_function = 10^(snr_function_dB/10); % regular snr
bw = obw(sig,fs); % Assumption: Channel BW = Signal BW

capacity = bw*log2(1 + snr_function) % capacity in bps
level = floor(2^(1/2*log2(1 + snr_function))) % highest number of usable voltage levels