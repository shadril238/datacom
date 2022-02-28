
% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 2
% Title: Analog Signal quantization using MATLAB
% Performance Task for Lab Report (Method - 1)
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

level= 2^H + 2;
fs=3000;
t=0:1/fs:0.1;

xt= (H+5)*cos(2*pi*((D+E+5)*10)*t) + (H+7)*sin(2*pi*((E+F+10)*10)*t);


Nsamples=length(xt);%calculating the total number of samples
quantised_out= zeros(1,Nsamples);
del=(max(xt)-min(xt))/level;%determining the step size
Llow= min(xt)+del/2;
Lhigh= max(xt)-del/2;

for i=Llow:del:Lhigh
    for j=1:Nsamples
        if(((i-del/2)<=xt(j)) && (xt(j)<=(i+del/2)))
            quantised_out(j)=i;
        end
    end
end

plot(t,xt,'r-.','linewidth',1.5);
hold on;
plot(t, quantised_out,'k-.','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('example of manual quantization method 1');
legend('Original signal','quantized signal');



