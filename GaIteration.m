function GaIteration(gaDat)
%  Optional user task executed at the end of each iteration
% For instance, results of the iteration
disp('------------------------------------------------')
disp(['Iteration: ' num2str(gaDat.gen)])
disp(['   minChromIndex: ' mat2str(gaDat.xmin) ' -- minScore: ',num2str(gaDat.fxmin)])
disp(['   maxChromIndex: ' mat2str(gaDat.xmax) ' -- maxScore: ',num2str(gaDat.fxmax)])
disp(['   TotalFitnessScore: ' mat2str(gaDat.fitnVTotal) ])

lineGraphDataX = gaDat.gen;
%lineGraphDataY = gaDat.fxmax;
hold on
figure(1)
title('MaxFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('MaxFitnessScore') % y-axis label
plot(lineGraphDataX,gaDat.fxmax,':ks');
hold off
drawnow
hold on
figure(2)
title('MinFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('MinFitnessScore') % y-axis label
plot(lineGraphDataX,gaDat.fxmin,':ks');
hold off
drawnow
hold on
figure(3)
title('TotalFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('TotalFitnessScore') % y-axis label
plot(lineGraphDataX,gaDat.fitnVTotal,':ks');
hold off
drawnow
