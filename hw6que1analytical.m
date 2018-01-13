% Emmanuel S Akosah     ENGS22
% HW 6, ques 1d


t = linspace(0,0.00001,100);
 
R = 100;
L = 0.0001;
C = 5*10^(-9);
 
z = R*sqrt(L*C)/(2*L);
w = 1./sqrt(L*C);
a = 150/(1.5*L);
 
phi = atan2(w*sqrt(1-z.^2), a-(w*z)) - atan2(sqrt(1-z.^2), -z);
 
v = (1.5/C).*((a./w.^2) + (((w*sqrt(1-z.^2)).^(-1)).*sqrt(((a./w)-z).^2+(1-z.^2)).*exp(-z.*w.*t).*sin((w.*sqrt(1-z.^2)).*t+phi)));
 
 
plot(t,v)
title('Output voltage vs time')
xlabel('time')
ylabel('Vout')

