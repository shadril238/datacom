% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 4
% Title: Study of Nyquist bit rate and Shannon capacity using MATLAB
% Class Task for Lab Report
close all;
clc;
%ID= 20-42451-1
A=2;
B=0;
C=4;
D=2;
E=4;
F=5;
G=1;
H=1;

%(a)
A1=A+B+H;
A2=B+C+H;
s=(C+D+H)/30;


fs= 5000;% sampling freqency
t= 0:1/fs:1-1/fs;%time array

signal = A1*sin(2*pi*((C+D+H)*100)*t ) + A2*cos(2*pi*((D+E+H)*100)*t) ;
noise = s*randn(size(t));
x = signal+noise;
%(b)
power_signal = sum(signal.^2)/length(signal); %signal power
power_noise = sum(noise.^2)/length(noise); %noise power
%power_signal2= A1^2/2 + A2^2/2; 
%power_noise12=s^2;
SNR_dB= snr(signal,noise); % SNR in dB using snr() function
regularSNR= power_signal/power_noise; %regular SNR using defination
%regularSNR2= power_signal2/power_noise2;
regularSNR2=10^(SNR_dB/10);% regular snr from SNR_dB
%(c)
bandwith=obw(signal ,fs); % bandwith calculation. ssumption: Channel BW = Signal BW
max_capacity = bandwith*log2(1 + regularSNR); % max capacity in bps
%(d)
level = floor(2^(1/2*log2(1 + regularSNR))); % highest number of usable voltage levels