%ID=20-42451-1
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

fs=4001;
t=0:1/fs:1-1/fs;

am1=(F+2);
fm1=(G+1);
mt1=am1*cos(2*pi*fm1*t);

am2 = (F+5);
fm2= (G+2);
mt2=am2*cos(2*pi*fm2*t);
  
am3 = (F+8); 
fm3 = (G+3);
mt3 = am3*cos(2*pi*fm3*t);

am4 = (F+11); 
fm4 = (G+4);
mt4 = am4*cos(2*pi*fm4*t);

%% Carrier Signal Generation
Cm1 = 1; %Amplitude of First Carrier Signal
fc1 = 100; %Frequency of First Carrier Signal
c1 = Cm1*cos(2*pi*fc1*t); % First Carrier Signal

Cm2 = 1; %Amplitude of Second Carrier Signal
fc2 = 150; %Frequency of Second Carrier Signal
c2 = Cm2*cos(2*pi*fc2*t); % Second Carrier Signal

Cm3 = 1; %Amplitude of Third Carrier Signal
fc3 = 200; %Frequency of Third Carrier Signal
c3 = Cm3*cos(2*pi*fc3*t); % Third Carrier Signal

Cm4 = 1; %Amplitude of Forth Carrier Signal
fc4 = 230; %Frequency of Forth Carrier Signal
c4 = Cm4*cos(2*pi*fc4*t); % Forth Carrier Signal

%% Composite Signal Generation
x = (mt1).*c1+(mt2).*c2+(mt3).*c3+(mt4).*c4;
%%figure of signals in time domain
figure; %1
subplot(4,1,1);
plot(t,mt1);
xlabel('time');
ylabel('amplitude');
title('Message Signal 1 in Time Domain');
ylim([-am1 am1]);

subplot(4,1,2);
plot(t,mt2);
xlabel('time');
ylabel('amplitude');
title('Message Signal 2 in Time Domain');
ylim([-am2 am2]);

subplot(4,1,3);
plot(t,mt3);
xlabel('time');
ylabel('amplitude');
title('Message Signal 3 in Time Domain');
ylim([-am3 am3]);

subplot(4,1,4);
plot(t,mt4);
xlabel('time');
ylabel('amplitude');
title('Message Signal 4 in Time Domain');
ylim([-am4 am4]);

%freq. domain conversion
M1 = abs(fftshift(fft(mt1)))/(fs/2); %Fourier Transformation of mt1
M2 = abs(fftshift(fft(mt2)))/(fs/2); %Fourier Transformation of mt2
M3 = abs(fftshift(fft(mt3)))/(fs/2); %Fourier Transformation of mt3
M4= abs(fftshift(fft(mt4)))/(fs/2); %Fourier Transformation of mt4
X = abs(fftshift(fft(x)))/(fs/2); %Fourier Transformation of x (composite sig.)
f = fs/2*linspace(-1,1,fs);

figure; %2
subplot(4,1,1);
%%plot(f,M1)
stem(f,M1);
xlabel('frequency');
ylabel('amplitude');
title('Message Signal 1 in Frequency Domain');
axis([-10 10 0 9]);

subplot(4,1,2);
%%plot(f,M2)
stem(f,M2);
xlabel('frequency');
ylabel('amplitude');
title('Message Signal 2 in Frequency Domain');
axis([-10 10 0 12]);

subplot(4,1,3);
%%plot(f,M3)
stem(f,M3);
xlabel('frequency');
ylabel('amplitude');
title('Message Signal 3 in Frequency Domain');
axis([-10 10 0 15]);

subplot(4,1,4);
stem(f,M4);
xlabel('frequency');
ylabel('amplitude');
title('Message Signal 4 in Frequency Domain');
axis([-10 10 0 20]);

figure %3
subplot(2,1,1);
plot(t,x);
xlabel('time');
ylabel('amplitude');
title('Composite Signal in Time Domain');
subplot(2,1,2);
stem(f,X);
xlabel('frequency');
ylabel('amplitude');
title('Composite Signal in Frequency Domain');
axis([-270 270 0 7]);

%% Passing the Composite Signal Through Bandpass Filter
[num1, den1] = butter(5, [(fc1-fm1-6)/(fs/2),(fc1+fm1+6)/(fs/2)]);
%Butterworth Filter Window Determining for Bandpass Filter
bpf1 = filter(num1,den1,x); %Filtering is done here

[num2, den2] = butter(5, [(fc2-fm2-6)/(fs/2),(fc2+fm2+6)/(fs/2)]);
bpf2 = filter(num2,den2,x); 

[num3, den3] = butter(5, [(fc3-fm3-6)/(fs/2),(fc3+fm3+6)/(fs/2)]);
bpf3 = filter(num3,den3,x); 

[num4, den4] = butter(5, [(fc4-fm4-6)/(fs/2),(fc4+fm4+6)/(fs/2)]);
bpf4= filter(num4,den4,x); %Filtering is done here

%% Mixing
z1 = 2*bpf1.*c1;
z2 = 2*bpf2.*c2;
z3 = 2*bpf3.*c3;
z4=  2*bpf4.*c4;
%%
%% Passing the Mixed Signals Through Lowpass Filter
[num5, den5] = butter(5, (fm1+3)/(fs/2)); %Low pass filter is made here
rec1 = filter(num5,den5,z1); %Filtering is done here
[num6, den6] = butter(5, (fm2+3)/(fs/2)); 
rec2 = filter(num6,den6,z2); 
[num7, den7] = butter(5, (fm3+3)/(fs/2));
rec3 = filter(num7,den7,z3);
[num8, den8] = butter(5, (fm4+3)/(fs/2));
rec4 = filter(num8,den8,z4);
%%
%%
%% Plotting the Received Signals in Time-Domain and Frequency Domain
figure; %3
subplot(4,1,1);
plot(t,rec1);
xlabel('time');
ylabel('amplitude');
title('received signal 1 in time domain');
ylim([-am1 am1]);

subplot(4,1,2);
plot(t,rec2);
xlabel('time');
ylabel('amplitude');
title('received signal 2 in time domain');
ylim([-am2 am2]);

subplot(4,1,3);
plot(t,rec3);
xlabel('time');
ylabel('amplitude');
title('received signal 3 in time domain');

subplot(4,1,4);
plot(t,rec4);
xlabel('time');
ylabel('amplitude');
title('received signal 4 in time domain');
ylim([-am4 am4]);
%freq. domain conversion
R1 = abs(fftshift(fft(rec1)))/(fs/2); %Fourier Transformation is done here
R2 = abs(fftshift(fft(rec2)))/(fs/2); 
R3 = abs(fftshift(fft(rec3)))/(fs/2); 
R4 = abs(fftshift(fft(rec4)))/(fs/2); 

figure;%5
subplot(4,1,1);
stem(f,R1);
xlabel('frequnecy');
ylabel('amplitude');
title('received signal 1 in frequnecy domain');
axis([-10 10 0 9]);

subplot(4,1,2);
stem(f,R2);
xlabel('frequnecy');
ylabel('amplitude');
title('received signal 2 in frequnecy domain');
axis([-10 10 0 12]);

subplot(4,1,3);
stem(f,R3);
xlabel('frequnecy');
ylabel('amplitude');
title('received signal 3 in frequnecy domain');
axis([-10 10 0 15]);

subplot(4,1,4);
stem(f,R4);
xlabel('frequnecy');
ylabel('amplitude');
title('received signal 4 in frequnecy domain');
axis([-10 10 0 20]);
%% End
