% Emmanuel S Akosah     ENGS22
% Lab 2,Postlabque 3. Jan 23, 2017




%import time intervals
delt = load('test3.txt');

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
v0 = 1.4;
v = (-fc /me) .* t + v0;
v2 = (v0 + (fc/b))* exp((-b .* t)/me) - (fc/b);

plot(tmean,velocity,(t+5.8),v2,'r')
xlabel('Time (s)') 
ylabel('Velocity (m/s)') 
title('Velociy Vs Time') 
axis([4 10 0 1.4])
legend('experimental','analytical')

% b) how I found B
% When B is factored out in the differential equation for test mode 2,
% the remaining expression is
% B= -1/v * (fc + me * (dv/dt))
% dv/dt is the slope of the curve of velocity against time. To find 
% dv/dt, I fitted the experimental curve with a quadratic curve and took the 
% derivative of the equation of quadratic curve. At multiple points of v, I 
% calculated dv/dt. With values for v and corresponding dv/dt, I calculated
% three values for B and took their average.
