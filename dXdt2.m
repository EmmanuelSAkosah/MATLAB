




function f = dXdt2(t,sv)
k1 =k2= 1;                                  % Spring Stiffness
b1= b2 = 1;                                % Damping
m = 1;                                       % Mass
f1= ;
f2= ;


% Differential Equations for State Variables should be provided below

 f(1) = sv(2);   %sv(1)= displacement,x1  sv(2) = velocity,v1
                    %sv(3)= displacement,x2  sv(4) = velocity,v2
 f(2) = (1/m)*(-k1*sv(1)-b1*sv(2)-k2*sv(1)+k2*sv(3)-b2*sv(4) + f2);
 f(3) = sv(4);
 f(4) = (1/m)*(k2*sv(1)-k2*sv(3)+ b2*sv(2)-b2*sv(4) - f1);
 f = f';
 end