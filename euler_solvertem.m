% Euler_Solver.m (Matlab5 program)
% By: Lee Lynd % Date: January 9, 2003 
% Rev.  January 5, 2009  by L. Ray 
%Rev.  December 13, 2012 by R. Halter


% Description: A program that provides a template for students writing a program
% to implement the Euler method as part of Engs 22, Lab 0.


% Students need to insert code specifying constant values, initial conditions,
% derivatives of both state variables, calculating/storing values for state
% variables, and plotting results.  These items can be entered where noted
% below in capital letters.


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

%***************************************************************************
% Parameters of the simulation
Tf = 20;                    % Final time = Duration of simulation (units are up to you)* 
Ts = 0;                     % Start time = initial time (usually starts at 0) 
delT = .01;                 % Step size 
tvect = Ts:delT:Tf;       % Vector of time points from Ts to Tf 
Npoints = length(tvect);    % Number of time points

% Define & dimension data matrix 
S = zeros(2,Npoints);       % Matrix of state variable values at different times.


% Problem-specific constants (put within the execution loop if time-variable) 
% INSERT CODE TO ENTER VALUE OF CONSTANTS (C, M, K)
C = 0.5;
M = 1;
K = 1;
delT = 0.01;
i = 1;
% INSERT CODE TO ENTER INITIAL CONDITIONS FOR BOTH STATE VARIABLES
T = 0;
X0 = 0;
V0 = 1;      
S(1,i) = 0;
S(2,i) = 1;
% Execute Euler method
for (i = 2:Npoints)         % t is a time index (tells you what time point                             
                            % you are analyzing.  This will be the index                             
                            % into both tvect and S                            
                            % This loop runs from index 2 to Npoints                             
                            % i.e. the simulation runs from time = delT to Tf  
                            % --> tvect(2) = delT 


dxdt = V0;                  %INSERT CODE FOR THE TWO FIRST ORDER DIFFERENTIAL EQUATIONS
dvdt = (-C*V0/M) - ((K*X0)/M);
                                    
X = X0 + dxdt*delT;                       %INSERT CODE FOR CALCULATING/STORING VALUES OF THE UPDATED STATE VARIABLES IN A DATA MATRIX.
V = V0 + dvdt*delT;


S(1,i) = X;
S(2,i) = V;
   % update                         
  X0 = X;
  V0 = V;
end

%INSERT CODE TO PLOT BOTH STATE VARIABLES AS A FUNCTION OF TIME (WITH AXES LABELED AND LEGEND)
plot(tvect,S(1,:))
ylabel('time')
hold on
plot(tvect,S(2,:),'k:')
xlabel('state variables,x and v')
ylabel('time')