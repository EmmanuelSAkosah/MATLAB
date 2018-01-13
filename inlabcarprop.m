% Emmanuel S Akosah     ENGS22
% Lab 2,Postlab,que 4. Jan 23, 2017



%a)
%import time intervals
delt = load('test6prop.txt');

%distance interval
wdiam = 2.795*0.0254; 
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



t = linspace(0,5.5,30);
me = 3.35355;
fc = 0.508666;
b = 2.4722;
fp = 2.3368;
v2 = (-(fp/b) + (fc/b))* exp((-b .* t)/me) + (fp/b) - (fc/b);

plot(tmean,velocity,(t+0.15),v2,'r')
xlabel('Time (s)') 
ylabel('Velocity (m/s)') 
title('Velociy Vs Time') 



%b