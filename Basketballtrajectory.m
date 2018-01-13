%Emmanuel S Akosah                             
% Program that gives the correct angle to shoot a basketball in oder
% to make a target given a set of conditions:
% air resistance, wind flow, a screen (to model a person) facing your shot
% and a wall you can bounce the ball off of to make the shot
%
% input: file that gives values for set conditions
%        
%
%

function Basketballtrajectory()
% Inputs
inputs = load('inputs.txt');
m = inputs(1,:);               %mass of ball
k = inputs(2,:);               %coeeficient constant of air resistance
v0 = inputs(3,:);              % initial velocity at which ball is shot
dscr = inputs(4,:);            % distance to screen 
hscr = inputs(5,:);            % height of screen
dbskt = inputs(6,:);           % distance to target
dwall= inputs(7,:);            % distance to wall
vwind= inputs(8,:);            % velocity of wind
tol= inputs(9,:);              % target tolerance
thetahi = inputs(10,:);        % higher bound angle
thetalo = inputs(11,:);        % lowerbound angle

%other Inputs
g = 9.8;
x0 = 0;
z0 = 0;



                       %   "Swish" shot;direct throw to target



 angle = (thetalo + thetahi)/2; % use average of the bounding angles

i = 0;                            %iteration counter
done = 0;
while (~done)
      
    zpos = z0;
    xpos = x0; 
    [xplt,zplt,maxh,bank,xpos] = trajec_calc(angle,v0,vwind,k,m,dwall);
    
    
  
    if xpos > (dbskt + tol)
        thetahi = angle;
        angle = (thetalo + thetahi)/2;
    end
    if xpos < (dbskt - tol)
        thetalo = angle;
        angle = (thetalo + thetahi)/2;
    end
    
    if( (xpos > dbskt - tol) && (xpos < dbskt + tol) )
        done = 1;
    else
        xplt(:) = [];             %free unused plotting data vals
        zplt(:) = [];
        j = 1;
    end
    i = i+1;
    angplt(i,1) = angle;          %data for plotting angle convergence
end
fprintf('');
fprintf('        Swish shot\n');
fprintf('     -----------------\n');
fprintf('Correct angle for "swish" shot is [%f]\n',angle);
fprintf('%d bisections were made to find this angle\n',i);
fprintf('Maximum altitude of the ball is %.1f\n',maxh);
%plot
subplot(2,1,1);
plot(xplt,zplt);                % swish shot trajectory
axis([0,dwall+2,0,30]);
xlabel('Distance(m)');
ylabel('Height(m)');
title('Trajectory of ball');
hold on
v = axis();
plot([dwall dwall],v(3:4),'r','linewidth',4)     % wall
plot([dscr dscr],[0 8],'r','linewidth',2)        %screen
plot([0 dwall],[maxh maxh],'k:') 
text(16.5,0.8,'target -->','FontSize',7);

% plot of angles converginging to correct angle
subplot(3,2,5);
plot(angplt);                     
axis([0,16,70,85]);
hold on
plot([0 15],[angle angle],'k:') 
title('Angle Convergence');
xlabel('No of Iterations');
ylabel('Angle(degrees)');



%                   "Bank" shot; bouncing ball off of wall to make the target


 thetahi = 75;                        %75 degrees
 thetalo = 65;                        % 65 degrees
angle = (thetalo + thetahi)/2;

angplt(:) = [];                   % empty data for plotting angle convergence
i = 0;
j = 0;
done = 0; 
while (~done)
      
    zpos = z0;
    xpos = x0; 
    
     % traj_calc computes x and z positions of the ball
    [ xplt,zplt,maxh,bank,xpos] = trajec_calc(angle,v0,vwind,k,m,dwall);  
    
    %fprintf('xpos zpos angle \n')
    %fprintf('%f %f %f\n',xpos,zpos,angle)
    
  % Using method of bisection to find angle 
  % at which to shoot to make the target
      if xpos > (dbskt + tol)
        thetahi = angle;
        angle = (thetalo + thetahi)/2;
    end
    if xpos < (dbskt - tol)
        thetalo = angle;
        angle = (thetalo + thetahi)/2;
    end
    
    if( (xpos > dbskt - tol) && (xpos < dbskt + tol) )
        done = 1;                  %set condition to terminate loop when target is made
    else
        xplt(:) = [];             %free unused plotting data vals
        zplt(:) = [];
        j = 1;
    end
    i = i+1;
    angplt(i,1) = angle;
end


% Output: includes text and plots
fprintf('\n\n        Bank shot\n');
fprintf('     -----------------\n');
fprintf('Correct angle for "bank" shot is [%f]\n',angle);
fprintf('%d bisections were made to find this angle\n',i);
fprintf('Maximum altitude of the ball is %.1f\n',maxh);
fprintf('Bank spot on the wall is %.1f',bank);
subplot(2,1,1);
plot(xplt,zplt);
legend('Swish shot','wall','screen','max height','Bank shot','location','eastoutside');
plot([0 dwall],[maxh maxh],'k:')
text(20,12,'Bank spot -->','FontSize',7);
hold off


% plot of angles converginging to correct angle
subplot(3,2,6);
plot(angplt);        
hold on
axis([0,14,65,75]);
plot([0 15],[angle angle],'k:')
title('Angle Convergence');
xlabel('No of Iterations');
ylabel('Angle(degrees)');
hold off


end