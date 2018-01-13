% Emmanuel S Akosah     ENGS22
% Lab 2,Pre lab,que 3. Jan 23, 2017




%import time intervals
delt = load( 'PracticeMode2data.txt');

%distance interval
wdiam = 2.7*0.0254; 
wcircum = wdiam*pi;
wprd = 40;
delx = wcircum/wprd;

%time interval
intclck = 28.2.*10^-6;
delt = intclck*delt; 
tvectors = cumsum(delt);


%finding velocity
velocity = delx ./ delt;

tmean = zeros(1,length(delt));
tmean(1)= delt(1) / 2;
for n = 2:length(delt)
 tmean(n) = tvectors(n-1) + (delt(n)/2);
end 



plot(tmean,velocity)
xlabel('Time (s)') 
ylabel('Velocity (m/s)') 
title('Velociy Vs Time') 
