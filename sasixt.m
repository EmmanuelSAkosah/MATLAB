%Emmanuel S Akosah                                 


data = load('tiny_data.txt');

%Scatter plot
subplot(2,1,1);

x = 1: length(data);
x = x';
s = std(data);
m = mean(data);
scatter(x,data,'.');
axis([0,700,20,60]);
hold on
text(350,50,'outliers');
xlabel('Count');
ylabel('Value');
title('Scatter Plot');

% mean line
ml = refline([0 m]);

% std lines
sl1 = refline([0 (2.5*s + m)]);
sl2 = refline([0 (m - (2.5*s))]);
out = data >= m + 2.5*s;
data2 = data;
data2(~out) = 0;
scatter(x,data2,40,'o');

hold off

% Histogram 1
subplot(2,3,4)
histogram(data)
axis([25,55,0,175]);
hold on
xlabel('Value');
ylabel('Number');
title('Histogram 1');

%mean line
ml2 = 1:200;
ml2 = ml2';
ml2(:) = m;
%fprintf('%f',m)
y = 1:200;
y = y';
plot(ml2,y,'--k')

% std lines
ml2(:) = (m + 2.5*s);
plot(ml2,y,':k')
ml2(:) = (m - 2.5*s);
plot(ml2,y,':k')


hold off

% Histogram 2
subplot(2,3,5);
data = data(~out);
m = mean(data)
%fprintf('%f',m)
histogram(data,10);
hold on
xlabel('Value');
ylabel('Number');
title('Histogram 2');


% mean line
ml2(:) = m;
plot(ml2,y,'--m')

% std lines
s = std(data);
ml2(:) = (m + 2.5*s);
plot(ml2,y,':m')
ml2(:) = (m - 2.5*s);
plot(ml2,y,':m')

hold off


% Histogram 3
subplot(2,3,6)
histogram(data,70);
axis([26,40,0,30]);
hold on
xlabel('Value');
ylabel('Number');
title('Histogram 3');

% mean line
ml2(:) = m;
plot(ml2,y,'--m')

% std lines
ml2(:) = (m + 2.5*s);
plot(ml2,y,':m')
ml2(:) = (m - 2.5*s);
plot(ml2,y,':m')
hold off