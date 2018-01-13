% Emmanuel S Akosah     ENGS22
% HW 6, ques 4d

R = 10;
C = 5;
w = linspace(0.001,10);
Response = (1+ j*w*R*C) .^(-1);
Magnitude= abs(Response);                  %response
Phase = angle(Response);
Phase = Phase * (180/pi);                  %express phase in degrees


%Plotting
figure(1)
semilogx(w,Magnitude);
title('Frequency Response')
xlabel('frequency')
ylabel('Magnitude Response')
grid on

figure(2)
semilogx(w,Phase);
title('Frequency Response')
xlabel('frequency')
ylabel('Phase Response')
grid on
