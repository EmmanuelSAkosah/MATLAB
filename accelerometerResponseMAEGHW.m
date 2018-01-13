 
%Emmanuel S Akosah ID 1155107217  10/11/2017
% MAEG 3050 HW Ques 2 b and c 


                 %%%% b. With non-zero initial conditions 
%initial conditions
y0 = 2;
dy0 = 1;

%constants
M = 0.1;
Ms = 200;
F0 = 200;


% design values
s1 = -4;
s2 = -7;
b = 1.1;
k = 2.8;

% coefficients
A = ((s1*y0 + dy0 + b*y0/M) / (s1-s2) ) - (F0 / (Ms*s1*(s1-s2)) ) ;
B = ((s2*y0 + dy0 + b*y0/M) / (s2-s1) ) - (F0 / (Ms*s2*(s2-s1)) ) ;
C = A;
D = B;

%Accelerometer Equation
t = 0:0.2:5;
y = A*exp(s1*t) + B*exp(s1*t) + C*exp(s1*t) + D*exp(s2*t) - ((M*F0)/ (k*Ms));

%plotting
Y = -k*y/M;   % y axis
subplot(2,1,1)
plot(t,Y);
title ('Acceleration  vs Time')
xlabel(' Time (s) ')
ylabel(' Acceleration (m/s^2')
hold on


%comments
%Yes, the plot shows the desired performance, a steady acceleration 
%reading at 1.5s, is achieved

             %%%% c. With zero initial conditions 
y0 = 0;
dy0 = 0;

% coefficients
A = ((s1*y0 + dy0 + b*y0/M) / (s1-s2) ) - (F0 / (Ms*s1*(s1-s2)) ) ;
B = ((s2*y0 + dy0 + b*y0/M) / (s2-s1) ) - (F0 / (Ms*s2*(s2-s1)) ) ;
C = A;
D = B;

%Accelerometer Equation
y = A*exp(s1*t) + B*exp(s1*t) + C*exp(s1*t) + D*exp(s2*t) - ((M*F0)/ (k*Ms));

%plotting
Y = -k*y/M;   % y axis
subplot(2,1,2)
plot(t,Y);
title ('Acceleration  vs Time')
xlabel(' Time (s) ')
ylabel(' Acceleration (m/s^2')
hold off

%comments
%No, changing the initial conditions do not affect the performance of the
% design
