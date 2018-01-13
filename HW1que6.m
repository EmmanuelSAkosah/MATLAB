% Emmanuel S Akosah     ENGS22
%HW 1.que.6



Tf = 20;                    % Final time = Duration of simulation (units are up to you)* 
Ts = 0;                     % Start time = initial time (usually starts at 0) 
delT = .01;                 % Step size 
tvect = Ts:delT:Tf;         % Vector of time points from Ts to Tf 
Npoints = length(tvect);

S = zeros(1,Npoints);
i = 1;
S(1,i) = 5;
X0 = 5;
for (i = 1:Npoints)         % t is a time index (tells you what time point                             
                            % you are analyzing.  This will be the index                             
                            % into both tvect and S                            
                            % This loop runs from index 2 to Npoints                             
                            % i.e. the simulation runs from time = delT to Tf  
                            % --> tvect(2) = delT 


dxdt = -X0/3;                  %INSERT CODE FOR THE TWO FIRST ORDER DIFFERENTIAL EQUATIONS

                                    
X = X0 + dxdt*delT;                       %INSERT CODE FOR CALCULATING/STORING VALUES OF THE UPDATED STATE VARIABLES IN A DATA MATRIX.


S(1,i) = X;
   % update                         
  X0 = X;
end

 %analytical solution
 x = 5*exp(-tvect/3);
 
 %joint plot
subplot(2,1,1)
plot(tvect,S(1,:),tvect,x)
xlabel('time')
ylabel('state variable,x')
title('joint plot')
legend('Euler sol', 'Anal sol')
%Euler solution plot
subplot(2,2,3)
plot(tvect,S(1,:))
xlabel('time')
ylabel('state variable,x')
title('Euler sol. plot')
subplot(2,2,4)
%analytical solution plot
plot(tvect,x)
xlabel('time')
ylabel('state variable,x')
title('analyt. sol. plot')