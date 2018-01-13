% Emmanuel S Akosah     ENGS22
% Lab 0 Jan 1, 2017

% Euler_Error_Analysis_solution.m  

% The format of the program is as follows:
%    S(,) is a matrix of state variable values at different times such that
%    S(1,1) = value of the first state variable at t = 0,
%    S(1,2) = value of the first state variable at t = delT,
%    in general, S(i,j) = value of the ith state variable at t = delt*(j - 1)

%    dSdt() is a vector of first derivatives such that
%    dSdt(1) is the first derivative of the first state variable
%    dSdt(2) is the first derivative of the second state variable

%  derivatives are reevaluated with every iteration of the execution loop
%  and thus can change according to the values of state variables.


% Compute the error between the Euler solution and analytic solution for 
% the different specified delta t values.


% SETUP A VECTOR OF deltaT VAUES TO USE
deltasT = 0.001:0.01:0.5;
% Simulation parameters that will remain fixed
Tf = 20;                    % Final time = Duration of simulation (units are up to you)*
Ts = 0;                     % Start time = initial time (usually starts at 0)
errX = zeros(1,length(deltasT));
errV = zeros(1,length(deltasT));
% Problem-specific constants (put within the execution loop if time-variable)
% INSERT CODE TO ENTER VALUE OF CONSTANTS (C, M, K)
K = 1;
C = 0.5;
M = 1;

% Compute Euler and Analytic solution for each delta t by running a loop 
% and changing delta t values each time through the loop

for i = 1:length(deltasT)  % Loop runs from 1 to number of delta t's being simulated
    

%***************************************************************************
% delta t dependnet parameters of the simulation
delT = deltasT(i);         % Set new step size each time through loop
tvect = [Ts:delT:Tf];       % Vector of time points from Ts to Tf
Npoints = length(tvect);    % Number of time points

% EULER METHOD
S = zeros(2,Npoints);

%initial conditions
T = 0;
X0 = 0;
V0 = 1;      
S(1,1) = 0;
S(2,1) = 1;
% Execute Euler method
for (k = 2:Npoints)         


dxdt = V0;                  
dvdt = (-C*V0/M) - ((K*X0)/M);
                                    
X = X0 + dxdt*delT;                       
V = V0 + dvdt*delT;

S(1,k) = X;
S(2,k) = V;
   % update                         
  X0 = X;
  V0 = V;
end




% ANALYTIC METHOD

wn = sqrt(K/M);
Z = C/(2* sqrt(K*M));
% X = (exp(W*z.*tvect)/(W*(1-z^2)^0.5)).* (sin(W*(1-z^2)^0.5.*tvect));
% V = (((-z*exp(W*z.*tvect))/((1-z^2)^0.5))*sin(W*(1-z^2)^0.5.*tvect) ) + ( exp(W*z.*tvect)*cos(W*(1-z^2)^0.5.*tvect) );

X = exp(-wn.*Z.*tvect)/(wn.*(1-Z^2)^0.5).*sin(wn.*(1-Z^2)^0.5.*tvect);
V = -Z.*exp(-wn.*Z.*tvect)/((1-Z^2)^0.5).*sin(wn.*(1-Z^2)^0.5.*tvect) + exp(-wn.*Z.*tvect).*cos(wn.*(1-Z^2)^0.5.*tvect);



%  COMPUTE RMS ERROR (INSERT SOLUTION VECTORS)
  errX(i) = rms(X, S(1,:));
  errV(i) = rms(V, S(2,:));

end

%euler solution plot
% subplot(2,2,1)
% plot(tvect,S(1,:))
% ylabel('time')
% hold on
% plot(tvect,S(2,:),'k:')
% title('Numerical Solution')
% xlabel('time')
% ylabel('state variables,x and v')
% legend('position','velocity')
% hold off
% 
% % analytical plot
% subplot(2,2,2)
% plot(tvect,X,tvect,V);
% title('Analytical Solution')
% xlabel ('Time (s)');
% ylabel ('Position and Velocity');
% legend ('Position','Velocity');
% hold off

% PLOT ERROR AS A FUNCTION OF delta t
% subplot(2,1,3)
plot(deltasT,errX)
hold on 
plot (deltasT,errV,'b--')
title('Error Plot')
xlabel ('Delta t');
ylabel ('Error');
legend ('Pos Err','Vel Err');
hold off
