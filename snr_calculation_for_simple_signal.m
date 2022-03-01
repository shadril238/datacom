%SNR calculation for simple signal

clc;
close all;

fs = 10000; % sampling frequency
t = 0:1/fs:3;
amp = 4;
freq = 5;
sig = amp*sin(2*pi*freq*t); % original signal
sd = 0.6; % standard deviation
noise = sd*randn(size(sig)); % noise
noisy_sig = sig + noise; % noisy signal
ps1 = amp^2/2; % signal power
pn1 = sd^2; % noise power

snr_theory_1 = (ps1/pn1); % regular snr
snr_theory_1_dB = 10*log10(snr_theory_1); % snr in dB

ps2 = sum(sig.^2)/length(sig);
pn2 = sum(noise.^2)/length(noise);

snr_theory_2 = (ps2/pn2); % regular snr
snr_theory_2_dB = 10*log10(snr_theory_2); % snr in dB

snr_function_dB = snr(noisy_sig); % works only if original signal is simple signal
%%% snr() returns SNR value in dB
snr_function = 10^(snr_function_dB/10); % regular snr

comp_regular = [snr_theory_1 snr_theory_2 snr_function];
comp_dB = [snr_theory_1_dB snr_theory_2_dB snr_function_dB];