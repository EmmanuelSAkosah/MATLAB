%Emmanuel S Akosah ID 1155107217  11/1/2017
% MAEG 3050 HW 3 Ques 3


%Plot showing trade off between swiftness and similarity
% Percent Overshoot Vs wnTp, Tp = peak time

dr = 0:0.002:1;
PO = exp(-dr.*pi./(sqrt(1-dr.^2))) * 100;
wnTp = pi./(sqrt(1- dr.^2));

%plotting
myplot = plotyy(dr,PO,dr,wnTp);
hold on
legend('P.O','wnTp')
grid on
xlabel('Damping Ratio')
ylabel(myplot(1),'Percent Overshoot')
ylabel(myplot(2),'wnTp')
ylim(myplot(2),[3 5])
title('Swiftness Vs Similarity')
hold off

