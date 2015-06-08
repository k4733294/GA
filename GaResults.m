function GaResults(gaDat,t)
% Optional user task executed when the algorithm ends

% For instance, final result
disp('------------------------------------------------')
disp('######   RESULT   #########')
disp(['   Objective function for xmin: ' num2str(gaDat.fxmin)])
disp(['   xmin: ' mat2str(gaDat.xmin)])
disp('------------------------------------------------')
disp(['  total time:  ' num2str(t)])

x = 1 : gaDat.gen;
figure(3)
title('MaxFitnessRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('MaxFitnessScore') % y-axis label
plot(x,gaDat.fxmaxgen,':ks');
figure(4)
title('MinFitnessRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('MinFitnessScore') % y-axis label
plot(x,gaDat.fxmingen,':ks');