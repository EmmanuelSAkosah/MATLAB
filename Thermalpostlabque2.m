% Emmanuel S Akosah     ENGS22
% Lab 5 Thermal System,Post Lab Q2,Q3
% Feb 13, 2017


clear all
%Ques 2
R = 4.15; % [C/W] Thermal Resistance
C = 6.043; % [J/C] Thermal Capacitanc e 
Q = 2.538; % [W] Qin calculated as power = V^2/Rheater
t = linspace(0,300); % [s] time interval of 0 to 300 seconds
T =((Q*R)*((exp(-t./(R*C) ))));
semilogy(t, T,'r')
title ('Time vs Steady State Temperature')
xlabel(' Time (s) ')
ylabel(' Temperature (C)')
grid on


%decaying/saturating exponential tau comparison

% tau from decaying exponential 
% = (ln(y2)-ln(y1) )/( x2 -x1 ) = 40.04
% This is very similar to the tau from the saturating exponential,which 38.39 .

% Que 3
% When Tx is sufficienlty small, the system gives small output excursions
% because the signal is high(on) only half the time and low(off) half the time.
% But when Tx is really high, the the signal is on for long enough for the 
% the plae to heat up till it has reached its maximum. At this point, the
% subsequent turning on and off of the signal doesn't do much to change
% the output. Thus, the output is no longer a function of the input.
