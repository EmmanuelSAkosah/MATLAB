% Lab 1: Scope
% Emmanuel S Akosah
% Ques 2
% 
% data Plotting


%input data
freq = [100,250,500,750,1000,1250,1500,2500,5000,10000,20000,100000];
ratio = [0.995,0.98,0.945,0.895,0.84,0.785,0.725,0.54,0.31,0.16,0.085,0.015];

phase = [3.7,9,17.5,25,32,39,43,56.7,71.7,80.5,85.1,88.0];
phase= -1 .* phase;


%Plotting
subplot(2,1,1);
semilogx(freq,ratio)
title('Magnitude Response');
xlabel('frequency,Hz')
ylabel('ration (output/input)')


subplot(2,1,2);
semilogx(freq,phase)
title('Phase Response');
xlabel('frequency,Hz')
ylabel('Phase');

%Que 3
% Yes. As frequency approaches zero, the plot( of output/input ratio),
% assymptotically approaches one. As frequency gets high, the plot approaches
% zero.
% On the phase vs frequency plot, very low frequncies lead to a
% phase shift pproaching zero whiles very high frequncies result in a 
% phase shift approaching 90 degrees.