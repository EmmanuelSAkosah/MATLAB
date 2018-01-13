function [ angle ] = ballwizard( thetahi,thetalo,v0,vwind,k,m)
%ballwizard computes the right angle to shoot a ball

% using method of bisection 
%   inputs : bracketing angles, thetahi and thetalo
      
%   returns the right angle and max altitude of ball
%function
% finding correct angle
                     % thetahi 60 degrees
                     % thetalo 70 degrees
                     
angle = (thetalo + thetahi)/2;
x0 = 0;
z0 = 0;
done = 0;
while (~done)
      
    zpos = z0;
    xpos = x0;
    angle
    
    [ xplt zplt maxh xpos zpos] = traj(angle,v0,vwind,k,m);
    
    fprintf('xpos zpos angle ')
    fprintf('%f %f %f\n',xpos,zpos,angle)
  
    if xpos > (dbskt + tol)
        thetahi = angle;
        angle = (thetalo + thetahi)/2
    end
    if xpos < (dbskt - tol)
        thetalo = angle;
        angle = (thetalo + thetahi)/2
    end
    
    % loop condition
    if( (xpos > dbskt - tol) && (xpos < dbskt + tol) )   % && (zpos > -tol && zpos < tol)  )
        done = 1;
    else
        xplt(:) = [];             %free unused plotting data vals
        zplt(:) = [];
        j = 1;
    end
    
end
fprintf('Correct angle to make the target with a "swish" shot is [%f]\n',angle)

end

