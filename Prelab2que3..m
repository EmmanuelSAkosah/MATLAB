% Emmanuel S Akosah     ENGS22
% Lab 2,Pre lab,que 3. Jan 21, 2017







%import time intervals
delt = importdata 'PracticeMode2data.txt' ;

%distance interval
wdiam = 2.7*0.0254; 
wcircum = d*pi;
wprd = 40;
delx = wcircum/wprd;

%time interval
intclck = 28.2.*10^-6;
delt = intclock*delt; 
tvectors = cumsum(delt);

%finding velocity
for i = 1:length(tvectors) % creating a for loop for calculation of tmean
    tmean = tvectors(i) + ((tvectors(i+1) - tvectors(i))/2); 
end
velocity = delx/tvectors;

plot(tvectors,velocity,)
xlabel('Time (s)') 
ylabel('Velocity (m/s)') 
title('Velociy Vs Time') 