%Emmanuel S Akosah ID 1155107217  10/31/2017
% MAEG 3050 HW 3 Ques 1

% comparing input voltages for different amplifier values,Ka


Ka = [10,80];
for index = 1 : length(Ka);
numR = [1];
denR = [0 1];
sysR = tf(numR,denR);

numG = [5000*Ka(index)];
denG = [1 1020 20000 5000*Ka(index)];
sysG = tf(numG,denG);

sysY = series(sysG,sysR);
V = sysR - sysY; % V, error = R(s) - Y(s)
t = 0:0.02:5;
[y t] = step(V,t);


%plotting
plot(t,y)
hold on
end

grid on
xlabel('Time (s)')
ylabel('Va (V)')
title('Input Variation with Ka')
legend ('Ka = 10','Ka = 80');
hold off




