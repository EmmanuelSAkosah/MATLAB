%ENGS 20
%Euler Aprrox using ODE solver 

[x,y] = ode45(@dXdt18,[0 3],1);   %MATLAB's built-in ODE45 function 
                                  %Takes in 1, function handle( of the %differential equation
                                  %         2, the span of the dependent variable, x in this case
                                  %         3, the initial value of dependent variable, 
                                  % returns a vector of x and y values, the solution to the differential equation
                                  
                                  
%plotting
plot(x,y);


xlabel ('X');
ylabel ('Y');
legend ('Euler Aprrox. using ODE solver');