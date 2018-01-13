% Emmanuel S Akosah     ENGS22
% Lab 1,Post lab. Jan 21, 2017

%Reads in *.csv data from saved oscilloscope waveforms and plots the data


clear all;
close all;
Data=csvread('scope_1.csv',2,0); %This reads in from the *.csv file
   
time=Data(:,1); %Stores first column in 'Data' to 'time' 
ch1=Data(:,2);  %Stores second column in 'Data' to 'ch1' 
ch2=Data(:,3);  %Stores third column in 'Data' to 'ch2'  

%plot
figure(1)
plot(time, ch1, 'b',time,ch2,'r','LineWidth',1.6);
%axis([time(1),time(length(time)),-1.4, 1.4]) 
grid on 
xlabel('time (s)','FontSize',14) 
ylabel('Voltage (V)','FontSize',14) 
title('Scope Plot: Input and Output of RC Circuit','FontSize',14) 
legend('Input - Ch1','Output - Ch2') 
set(gca, 'FontSize',11);

% plot ch1 vs ch2
figure(2) 
plot(ch1,ch2)
xlabel('Channel 1Voltage (V)') 
ylabel('Channel 2Voltage (V)')
axis equal;



% Part D
% The plot of channel 1 against channel 2 has an ellipse shape 
% because the two signals are out of phase. The shift in phase is caused 
% by the resistor-capacitor combination. The resistor attenuates the input
% voltage and the capacitor temporarily stores electric energy , releasing 
% it moments later.
% 
% if instead of a resistor and a capacitor, there was two resistors, the 
% curve would just be a straight line. This is because there wouldn't be 
% any change in phase between the input and output signals. And since the
% resistor combination will have a fixed resistance, the higher the input
% the higher the output will be.