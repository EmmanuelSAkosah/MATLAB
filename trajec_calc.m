function [ xplt,zplt,maxh,bank,xpos] = trajec_calc( theta,v0,vwind,k,m,dwall)
%trajec_calc returns array of positions decribing the trajectory of a basketball
%   inputs conditions fo shot:
%      angle at which ball is shot,theta
%      initial velocity,V0
%      coefficient of air resistance,k
%      velocity of wind,vwind
%      mass of ball,m
%      distance to wall,dwall
%   returns : an array x and z positions of the ball's trajectory
%           : the positon where the ball lands at the end of the
%             trajectory
%           : the spot where the ball banks of the wall for a bank shot

v0x = v0*cos(theta*pi/180); % resolving velocity into x component
v0z = v0*sin(theta*pi/180); % resolving velocity into z component

g = 9.8;                    % acceleration due to gravity
dt = 0.00025;               % defining small change in time,dt 
                            % for numerical computation

% initializing outputs: preassigning to arbitrary values to prevent
%                        unpredictable behaviour
zpos = 1;
x0 = 0;
z0 = 0;
j = 0;
maxh = 0;
bank = 0;
xplt = zeros(1000,1);       %preaalocating array
zplt = zeros(1000,1);



while (zpos >= 0)
    
% factoring in wind velocity to find effective velocity, veff
veff = sqrt((v0x-vwind)^2 + v0z^2);

    
% x and z positions
xpos = x0 + v0x*dt;
zpos = z0 + v0z*dt;


% factoring in air resistance: find f0x and f0z, forces that act on ball
% in x and z axes respectively
%to find xvel and zvel, resulting effective velocities in x and z axes
f0x = -k * veff * (v0x-vwind);
f0z = -k * veff * v0z - m*g;
xvel = v0x + (f0x/m)*dt;
zvel = v0z + (f0z/m)*dt;

% update starting velocities and positions with current values
v0x = xvel;
 if xpos >= dwall    
    v0x = -v0x;    % revearse velocity in x direction if ball bounces of wall
    bank = zpos;
 end
v0z = zvel;
x0 = xpos;
z0 = zpos;
j = j + 1;
xplt(j,1) = xpos;
zplt(j,1) = zpos;

%Max Height
 if zpos > maxh
    maxh = zpos;
 end

end

end

