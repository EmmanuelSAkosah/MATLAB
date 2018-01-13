%%Plotting Root locus
%% MAEG HW 

%Que 2
sys2 = tf([1 7 -8],[1 -2 13]);
rlocus(sys)
 
%Que 4
a = [1 0];
b = [1 4];
c = [1 8 32];
ab = conv(a,b);
den = conv(ab,c);
sys4 = tf([1 6],den);
figure(2)
rlocus(sys4)

%Que 5
sys5 = tf([1 8 25],[1 14 40 0]);
figure(3)
rlocus(sys5)


myden = conv([1 4],[1 8 32 0]);
sys6 = tf([1],myden);
rlocus(sys5)

