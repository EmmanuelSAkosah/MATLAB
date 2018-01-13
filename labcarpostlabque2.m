% Emmanuel S Akosah     ENGS22
% Lab 2,Post lab,que 2. Jan 23, 2017



%a
%import time intervals
delt = load('test2.txt');

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
v0 = 0.8;
v = (-fc /me) .* t + v0;
v2 = (v0 + (fc/b))* exp((-b .* t)/me) - (fc/b);

plot(tmean,velocity,(t+5.65),v,'r')
xlabel('Time (s)') 
ylabel('Velocity (m/s)') 
title('Velociy Vs Time') 
legend('experimental','analytical')


% b) How I computed Fc
% I fitted the experimenttal plot with a linear curve, suing in built matlab
% plot tools. The slope , as given in the equation of the linear curve, is 
% equated to the slope factor(fc/me) in the analytical solution. Fc is factored 
% out and computed.
