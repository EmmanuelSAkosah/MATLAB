% Emmanuel S Akosah     ENGS22
% Lab 4 Fluid Systems Jan 23, 2017



clear all;
wn = 0.5;
w = logspace(-1,1);
dr = [0.15 0.2 0.3 0.4 0.5 0.6];

for n = 1:length(dr)   %loops as many times as the number of different 
                       %damping ratios
    
Response = ((j*w).^2 + 2*dr(n)*wn*j*w + wn^2).^(-1); % general equation for 
Magnitude= abs(Response);                            %response
Phase = angle(Response);
Phase = Phase * (180/pi);                            %express phase in degrees

%Plotting
figure(1)
loglog(w,Magnitude);
xlabel('frequency(normalized)')
ylabel('Magnitude Response')
grid on
hold on

figure(2)
semilogx(w,Phase);
xlabel('frequency(normalized)')
ylabel('Phase Response')
grid on
hold off
end