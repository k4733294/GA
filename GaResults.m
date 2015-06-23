function GaResults(gaDat,t)
% Optional user task executed when the algorithm ends

% For instance, final result
disp('------------------------------------------------')
disp('######   RESULT   #########')
disp(['   Objective function for xmin: ' num2str(gaDat.fxmin)])
disp(['   xmin: ' mat2str(gaDat.xmin)])
disp('------------------------------------------------')
disp(['  total time:  ' num2str(t)])

figure(4)
title('MaxFitnessRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('MaxFitnessScore') % y-axis label
plot(gaDat.linGen(1,:),gaDat.fxmaxgen,':ks');
drawnow
figure(5)
title('MinFitnessRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('MinFitnessScore') % y-axis label
plot(gaDat.linGen(1,:),gaDat.fxmingen,':ks');
drawnow
figure(6)
title('FitnessTotalRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('FitnessTotalScore') % y-axis label
plot(gaDat.linGen(1,:),gaDat.fitnesstotalmaxgen,':ks');
drawnow
%{
figure(7)
title('EveryFitnessProgressMapFinalReport')
meshc(gaDat.fitnVGen);
axis tight
drawnow
%}
