% Shadril Hassan Shifat
% ID: 20-42451-1

% Data Communication Lab Task - 1
% Performance Task for Lab Report
% ID = AB-CDEFG-H

A=2;
B=0;
C=4;
D=2;
E=4;
F=5;
G=1;
H=1;

K1=A+B;
K2=G+H+2;

J1=deg2rad(D+G+20); % degree to radian
J2=deg2rad(30);
% Generating time array for approx. 3 cycles
sampling_rate=1000;
sampling_interval=1/sampling_rate;
t=0:sampling_interval:3/10;

% Question (a)
% For X1(t)
X1_t=K1*cos(2*pi*(E+F+5)*t+J1);
plot(t,X1_t,'b','linewidth',1.5);
%xlim([0 0.215]);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal, X1(t)');
% For X2(t)
figure;
X2_t=K2*cos(2*pi*(C+D+5)*t+J2);
plot(t,X2_t,'g','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal, X2(t)');

% Question (b)
% For X3(t)
figure;
X3_t=X1_t+X2_t;
plot(t,X3_t,'r','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal, X3(t)');

% Question (c)
figure;
subplot(3,1,1);
%X1_t=K1*cos(2*pi*14*t+J1);
plot(t,X1_t,'b','linewidth',1.5);
%xlim([0 0.215]);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal, X1(t)');

subplot(3,1,2);
%X2_t=K2*cos(2*pi*12*t+J2);
plot(t,X2_t,'g','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal, X2(t)');

subplot(3,1,3);
%X3_t=X1_t+X2_t;
plot(t,X3_t,'r','linewidth',1.5);
xlabel('time');
ylabel('amplitude');
title('sinusoidal signal, X3(t)');