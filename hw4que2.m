% Emmanuel S Akosah     ENGS22
% HW 4 Jan 31, 2017

clear;
k1 = 1;
k2 = 1;
m1 = 10;
m2 = 10;
b1 = 1;
b2 = 1;


A = [0 0 1 0; 0 0 0 1; -(k1+k2)/m1 k2/m1 -(b1+b2)/m1 b2/m1; k2/m2 -k2/m2 b2/m2 -b2/m2];
B = [0 0; 0 0; 0 1/m1; -1/m2 0];
C = [1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
D = 0;

t = linspace( 0,1500,1000);
f1 = heaviside(t);
f2 = heaviside(t-500)-heaviside(t-1000);
U = [f1; f2];


sys = ss(A,B,C(1,:),D);
[y,ti] = lsim(sys,U,t);
subplot(2,2,1);
plot(t,y)
title('x1');
xlabel('time')

sys = ss(A,B,C(2,:),D);
[y,ti] = lsim(sys,U,t);
subplot(2,2,2);
plot(t,y)
title('x2');
xlabel('time')

sys = ss(A,B,C(3,:),D);
[y,ti] = lsim(sys,U,t);
subplot(2,2,3);
plot(t,y)
title('v1');
xlabel('time')

sys = ss(A,B,C(4,:),D);
[y,ti] = lsim(sys,U,t);
subplot(2,2,4);
plot(t,y)
title('v2');
xlabel('time')
