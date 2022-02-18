%Example of quantization using Matlab built in function quantiz(): 

t = 0:0.01:1;
x = sin(2*pi*2*t);

figure
p = [-0.5 0 0.5]; % range or condition or partition
c = [-1 -0.33 0.33 1]; % levels or codebook
[i,q] = quantiz(x,p,c); % quantized signal will be returned inside 'q'

plot(t,x,'*',t,q,'x','linewidth',1.5)
xlabel('time')
ylabel('amplitude')
title('example of quantization using quantiz()')
legend('sampled signal','quantized signal')