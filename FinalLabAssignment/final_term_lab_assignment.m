% Shadril Hassan Shifat
% ID: 20-42451-1
% Data Communication Final Term Assignmant


%ID = AB-CDEFG-H

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
amp_00=0;
amp_01=(G+5);
amp_10= 2*(G+5);
amp_11= 3*(G+5);

%(a)Convert your text message into binary bit sequence.

transmitted_msg='1rS7';
disp('Text message at sender :');
disp(transmitted_msg);
dec=double(transmitted_msg); %Text to ASCII (decimal)
p2=2.^(0:-1:-7); % 2^0,2^-1,.......,2^-7
B=mod(floor(p2'*dec),2); %Decimal to binary conversion
                         %Columns of B are bits of chars
x=reshape(B,1,numel(B));%Bytes to serial conversion
disp('Binary information at Transmitter :');
disp(x);

%(b)Display the bit sequence from (a) as four level unipolar digital signal. Use 0 volt for binary ‘0 0’, use (G+5) volt for binary ‘0 1’, use 2*(G+5) volt for binary ‘1 0’, use 3*(G+5) volt for binary ‘1 1’. Bit rate of your digital signal must be (G+1)*10 bps.

br=(G+1)*10; %Bit rate
bp=1/br; %Bit period
bit=[];
for n=1:2:length(x)
    if x(n)==0 && x(n+1)==0
        se=zeros(1,100);
    elseif x(n)==0 && x(n+1)==1
        se=(G+5)*ones(1,100);
    elseif x(n)==1 && x(n+1)==0
        se=2*(G+5)*ones(1,100);
    else
        se=3*(G+5)*ones(1,100);   
    end
    bit=[bit se];
end

t1=bp/50:bp/50:50*length(x)*(bp/50);
figure;
plot(t1,bit,'lineWidth',2.5);
grid on;
%axis([0 bp*length(x) -.5 15]);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Transmitting information as digital signal');

%(c)Apply QASK on digital signal from (b). Use a carrier frequency of (G+1)*40 Hz. Assume we are transmitting this analog signal.

cf=br*(G+1)*40; %carieer freq.
t2=bp/100:bp/100:bp;
ss=length(t2);
m=[];
for i=1:2:length(x)
    if x(i)==0 && x(i+1)==0
        y=0*cos(2*pi*cf*t2);
    elseif x(i)==0 && x(i+1)==1
        y=(G+5)*cos(2*pi*cf*t2);
    elseif x(i)==1 && x(i+1)==0
        y=2*(G+5)*cos(2*pi*cf*t2);
    else
        y=3*(G+5)*cos(2*pi*cf*t2);
    end
    m=[m y];
end
t3= bp/50:bp/50:bp*length(x);

figure;
plot(t3,m);
grid on;
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Modulated Signal at Transmitter');

%(d)Add noise to your modulated signal and assume that the noisy signal is your received signal.

t4=bp/50:bp/50:bp*length(x);
Rec=awgn(m,10); %noise added to the signal
%subplot(4,1,3);
figure;
plot(t4,Rec);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('Received signal at Receiver');

%(e)Recover the bit sequence from the received noisy signal.
mn=[];
for n=ss:ss:length(Rec)
    y=cos(2*pi*cf*t2); %carrier signal
    mm=y.*Rec((n-(ss-1)):n);
    t5=bp/100:bp/100:bp;
    z=trapz(t5,mm);% intregation
    zz=round((2*z/bp));
    if(zz<=(amp_00+amp_01)/2)
        a1=0;
        a2=0;
    elseif(zz>(amp_00+amp_01)/2 && zz<=(amp_01+amp_10)/2)
        a1=0;
        a2=1;
    elseif(zz>(amp_01+amp_10)/2 && zz<=(amp_10+amp_11)/2)
        a1=1;
        a2=0;
    else 
        a1=1;
        a2=1;
    end
    mn=[mn a1 a2];
end
disp('Binary information at Reciver :');
disp(mn);

%(f)Display the recovered bit sequence from (e) as four level unipolar digital signal. Use 0 volt for binary ‘0 0’, use (G+5) volt for binary ‘0 1’, use 2*(G+5) volt for binary ‘1 0’, use 3*(G+5) volt for binary ‘1 1’. Bit rate of your digital signal must be (G+1)*10 bps.

bit=[];
for n=1:2:length(mn)
    if mn(n)==0 && mn(n+1)==0
        se=zeros(1,100);
    elseif mn(n)==0 && mn(n+1)==1
        se=(G+5)*ones(1,100);
    elseif mn(n)==1 && mn(n+1)==0
        se=2*(G+5)*ones(1,100);
    else
        se=3*(G+5)*ones(1,100);   
    end
    bit=[bit se];
end

t5=bp/50:bp/50:50*length(mn)*(bp/50);
figure;
plot(t5,bit,'lineWidth',2.5);
grid on;
%axis([0 bp*length(x) -.5 15]);
ylabel('amplitude(volt)');
xlabel('time(sec)');
title('Demodulated signal at receiver');

%(g)Regenerate your text message from recovered bit sequence of (e).

L=length(mn); %Length of input string
L8=8*floor(L/8); %Multiple of 8 Length
B=reshape(mn(1:L8),8,L8/8); %Cols of B are bits of chars
p2=2.^(0:7); %power of 2
dec=p2*B; %Binary to decimal conversion
txt=char(dec); %ASCII (decimal) to txt
disp('Text message at receiver :');
disp(txt);

