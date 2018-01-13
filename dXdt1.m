% Emmanuel S Akosah     ENGS22
% Lab 0 Jan 1, 2017


% This MATLAB function defines the differential equations for use by ODE45()
% State Variables are
%stvar(1) = X0; 
%stvar(2) = V0;

% Derivatives State Variables are stored in the f matrix
%   f(1) = dx/dt
%  f(2) = d2x/dt2


function f = dXdt1(t,stvar)
K = 1;                                  % Spring Stiffness
C = 0.5;                                % Damping
M = 1;                                  % Mass


% Differential Equations for State Variables should be provided below

 f(1) = stvar(2);
 f(2) = (-C*stvar(2)/M) - ((K*stvar(1))/M);
 f = f';
 end



