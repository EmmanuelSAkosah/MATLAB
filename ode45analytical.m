%%Emmmanuel S Akosah    %LAb 1 : Matlab  intro

[t,stvar] = ode45(@dXdt1,[1 20],[0 1]);

plot(t,stvar(:,1),t,stvar(:,2));


xlabel ('Time (s)');
ylabel ('Position and Velocity');
legend ('Position','Velocity');