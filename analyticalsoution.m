% Emmanuel S Akosah     ENGS22
% Lab 0 Jan 1, 2017

% analytical solution

C = 0.5;
M = 1;
K = 1;
Tf = 20;                    % Final time = Duration of simulation (units are up to you)* 
Ts = 0; 
delT = 0.01;                 % Step size 
tvect = Ts:delT:Tf;

wn = sqrt(K/M);
Z = C/(2* sqrt(K*M));
% X = (exp(W*z.*tvect)/(W*(1-z^2)^0.5)).* (sin(W*(1-z^2)^0.5.*tvect));
% V = (((-z*exp(W*z.*tvect))/((1-z^2)^0.5))*sin(W*(1-z^2)^0.5.*tvect) ) + ( exp(W*z.*tvect)*cos(W*(1-z^2)^0.5.*tvect) );

X = exp(-wn.*Z.*tvect)/(wn.*(1-Z^2)^0.5).*sin(wn.*(1-Z^2)^0.5.*tvect);
V = -Z.*exp(-wn.*Z.*tvect)/((1-Z^2)^0.5).*sin(wn.*(1-Z^2)^0.5.*tvect) + exp(-wn.*Z.*tvect).*cos(wn.*(1-Z^2)^0.5.*tvect);



% analytical plot
plot(tvect,X,tvect,V);
title('Analytical Solution')
xlabel ('Time (s)');
ylabel ('Position and Velocity');
legend ('Position','Velocity');
hold off
