%Emmanuel S Akosah ID 1155107217  10/31/2017
% MAEG 3050 HW Ques 5

% Showing allowable regions for different rise times
% within a given dr range,
% dr = damping ratio

% staying within valid range of dr
dr = 0.3:0.02:0.6;
tr = [0.4,0.6,0.8];

%Allowed Region, angle
upperBoundAngle = acos(min(dr)) * (180/pi)
lowerBoundAngle = acos(max(dr)) * (180/pi)

for ind = 1: length(tr);

%linear approx. of rise time vs damping ratio curve
% valid for range dr
wn = (2.16*dr + 0.6)/tr(ind);

    for index = 1: length(wn);
    %allowed real values
    real = -dr .* wn(index);
    %allowed complex values
    wd =  wn(index) .* sqrt(1-dr.^2);
    complex =  wd;

    %plotting
    %subplot(length(tr),1,ind);   
    plot(real, complex);
    plot(real, -complex); %show region on the negative half of complex axis
    axis([-5,5,-5,5]);
    title ('Allowable Region, Rise time = ')
    xlabel('real axis')
    ylabel('complex axis')
    grid on
    hold on
    end

%central axes
line([0 0],[-5 5]);
line([-5 5],[0 0]);
hold off
figure
end
