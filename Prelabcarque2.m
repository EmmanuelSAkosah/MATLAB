% Emmanuel S Akosah     ENGS22
% Lab 2,Pre lab,Part 2. Jan 23, 2017


delx = [0.5,1,1.5,2,2.5];
delt = [267,310,372,473,675];
delt = 0.001 * delt;


tvectors = cumsum(delt);
tmean = zeros(1,5);
tmean(1)= delt(1) / 2;
for n = 2:5
 tmean(n) = tvectors(n-1) + (delt(n)/2);
end 
velocity = 0.5 ./ delt; 

 

% model
t = linspace(0,3,30);
vi = 2;
c = 0.5;
tau = 2.5;

vmodel = (vi + c) * exp( -t ./ tau) - c;


plot(tmean,velocity,'ob',t,vmodel,'r')
xlabel('Time (s)') 
ylabel('Velocity (m/s)') 
title('Velociy Vs Time') 
legend('measured data','Model data') 