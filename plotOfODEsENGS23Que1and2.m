% %Emmanuel S Akosah ,Craig Calhoun
% %Engs 23 HW Que1 and 2
% 
%Plot of the solution to a 1st order ODE
x = linspace(1,10);
c = [0,5,10,15,20,25,30,35,40];
%plot solution for 9 diff values of c
for i=1:length(c);
    y = (x.*sin(x) + cos(x)) ./x + c(i)./x;
plot(x,y);  
hold on
title('Plot of Solution to ODE with different Cs');
ylabel('Output,y')
xlabel('Input,x') 
end
hold off 

%Que2
 x = linspace(-1000,1000);
 y = linspace(-1000,1000); 
[X,Y] = meshgrid(x,y);
 Isotherm = 1/2.*X.^2 + X.*Y -1/2.*Y;
 figure
 contour(X,Y,Isotherm,20) 
 title('Isotherm Plot') 
 ylabel('Y')
 xlabel('X')  