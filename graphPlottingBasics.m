%Author: Shadril Hassan Shifat (shadril238)


x = [0 1 2 3 4 5]; %time
y = [0 20 28 34 40 42]; %temparature
z = [10 9.5 9.1 8.4 7 5.8]; %weight

plot(x,y,'r*:','linewidth',2); % color- red(r), marker type- *, line style- dotted(:) and linewidth=2
%axis([0 5 0 45]); %axis([xmin xmax ymin ymax]) sets maximum and minimun of x and y axis
xlabel('time in seconds');

%ylabel('temparature in degree');
%title('observation of temparature change with time');

hold on; %command for plotting many graphs in same Figure. hold off ends the hold on.

% figure %command for new Figure window. 
% figure(x) %command for selecting Figure x

plot(x,z, 'gh-','linewidth',2);

%xlabel('time in seconds');
ylabel('weight in grams and temparature in degree');

title('observation of weight and temparature change with time');
%text(3,8.4,'This is a note at position (3,8.4)');

hold off;
legend('temparature', 'weight'); %legend

%for more type >> help plot
