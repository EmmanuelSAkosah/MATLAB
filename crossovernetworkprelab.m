% Emmanuel S Akosah     ENGS22
% Lab 5 Fluid Systems Feb 20, 2017


% constant values
r = 6;
c = 4.42 * 10^-6;
l = 6.37 * 10^-4;


f = logspace(2,8);
w = 2*pi.*f;
s = j*w;
 

%Woofer response
woofer = (1./(c.*l))./(s.^2+(s./(c.*r))+(1./(c.*l)));
wMagResponse = 20*log10(abs(woofer));         %in decibels,20*log10
wPhaseResponse = angle(woofer) * (180/pi); 

%Tweeter Response
tweeter = s.^2./(s.^2+(s./(c.*r))+(1./(c.*l)));
tMagResponse = 20*log10(abs(tweeter));          
tPhaseResponse = angle(tweeter) * (180/pi); 

%Cross Over
crossover = woofer - tweeter;
cMagResponse = 20*log10(abs(crossover));
cPhaseResponse = angle(crossover) * (180/pi); 


%Plotting
figure(1)
semilogx(w,wMagResponse);
hold on
semilogx(w,tMagResponse);
hold on
semilogx(w,cMagResponse,'r');
title('Magnitude Response')
xlabel('frequency(Hz)')
ylabel('Magnitude (dB)')
%lengend('Woofer','Tweeter','Crossover')
grid on
hold off

figure(2)
semilogx(w,wPhaseResponse);
hold on
semilogx(w,tPhaseResponse);
hold on
semilogx(w,cPhaseResponse,'--');
title('Phase Response')
xlabel('frequency(Hz)')
ylabel('Phase Response(degrees)')
%lengend('Woofer','Tweeter','Crossover')
grid on




