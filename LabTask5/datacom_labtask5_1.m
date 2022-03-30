% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 4
% Title: Study of Digital to Analog Conversion using MATLAB
% Performance Task for Lab Report (a)

close all;
clc;
clear all;
%ID=AB-CDEFG-H
A=2;
B=0;
C=4;
D=2;
E=4;
F=5;
G=1;
H=1;

% Converting E=4, F=5 and G=1 to 8 bit ASCII characters array
bitStream_1= dec2bin(E,8)-'0';
bitStream_2= dec2bin(F,8)-'0';
bitStream_3= dec2bin(G,8)-'0';
% genarating bit stream array
bitStream= [bitStream_1 bitStream_2 bitStream_3]; 
% calculating length of bit stream
n=length(bitStream); 
ts=2;
%frequency
fd=4.5;
fs=1000;
i=1;
g=0;

while i:3:n
    %width of any pulse 
    t=g*ts:1/fs:(g+1)*ts;
    %condition
    if bitStream(i)==0 && bitStream(i+1)==0 && bitStream(i+2)==0
        ask=1*sin(2*pi*fd*t);
        
    elseif bitStream(i)==0 && bitStream(i+1)==0 && bitStream(i+2)==1
        ask=1.5*sin(2*pi*fd*t);
        
    elseif bitStream(i)==0 && bitStream(i+1)==1 && bitStream(i+2)==0
        ask=2*sin(2*pi*fd*t);
        
    elseif bitStream(i)==0 && bitStream(i+1)==1 && bitStream(i+2)==1
        ask=2.5*sin(2*pi*fd*t);
        
    elseif bitStream(i)==1 && bitStream(i+1)==0 && bitStream(i+2)==0
        ask=3*sin(2*pi*fd*t);
        
    elseif bitStream(i)==1 && bitStream(i+1)==0 && bitStream(i+2)==1
        ask=3.5*sin(2*pi*fd*t);
        
    elseif bitStream(i)==1 && bitStream(i+1)==1 && bitStream(i+2)==0
        ask=4*sin(2*pi*fd*t);
        
    elseif bitStream(i)==1 && bitStream(i+1)==1 && bitStream(i+2)==1
        ask=4.5*sin(2*pi*fd*t);
    
    end
    %plotting graph
    plot(t,ask);
    title('8-ASK');
    xlabel('time');
    ylabel('amplitude')
    hold on;
    grid on;
    
    i=i+3;
    g=g+1;
end;
hold off;