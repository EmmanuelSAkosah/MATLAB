% Emmanuel S Akosah     ENGS22
% Lab 5 Thermal Systems Post Lab Q3 
% Feb 13, 2017

clear all;

%Ques 1
%Experimental data
T2 = csvread('scope_thermal.csv',2,0);
Temp = T2 (:,2);
Temp = Temp ./ 0.1; % converting data into temperature by factor of 0.1V/1C 
Time = T2 (:,1);
Time = Time + 315;  % shifting time scale forward

 % Analytical
R = 4.15; % [C/W] Thermal Resistance
C = 6.043; % [J/C] Thermal Capacitanc e 
Q = 2.538; % [W] Qin calculated as power = V^2/Rheater
t = linspace(0,300); % [s] time interval of 0 to 300 seconds
T =(Q*R)*(1-(exp(-t./(R*C)))) ; % analytical solution

% %Plotting
plot (t, T,'r')
title ('Time vs Steady State Temperature')
xlabel(' Time (s) ')
ylabel(' Temperature (C)')
hold on 
plot (Time, Temp)
legend ('analytical', 'experimental')
hold off


% Sources of error might include

% 1.The insulation of the aluminum plate from its support is not
% perfect and might lead some heat losses
% 2.The resisance and voltage measurements taken during the lab to 
% and used as parameters fo the analytical solution. these measurements are
% not perfectas they subject to interference from stray currents/signal
% from other electrical components in the lab