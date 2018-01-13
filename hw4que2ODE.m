%%Emmmanuel S Akosah    %HW4 que 2



[t,sv] = ode45(@dXdt2,[1 20],[0 1]);

plot(t,sv(:,1),t,sv(:,2),t,sv(:,3),t,sv(:,4));


xlabel ('Time (s)');
ylabel ('Position and Velocity');
legend ('x1','V1','X2','V2');

