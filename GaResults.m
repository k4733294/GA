function GaResults(gaDat,t,newMeloPath)
% Optional user task executed when the algorithm ends

% For instance, final result
disp('------------------------------------------------')
disp('######   RESULT   #########')
disp(['   Objective function for xmin: ' num2str(gaDat.fxmin)])
disp(['   xmin: ' mat2str(gaDat.xmin)])
disp(['   Objective function for xmax: ' num2str(gaDat.fxmax)])
disp(['   xmin: ' mat2str(gaDat.xmax)])
disp('------------------------------------------------')
disp(['  total time:  ' num2str(t)])

figure(4)
plot(gaDat.linGen(1,1:end),gaDat.fxmaxgen(1,1:end),':ks');
title('MaxFitnessRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('MaxFitnessScore') % y-axis label
fig4set = figure(4);
savePath = strcat(newMeloPath,'gaMax');
saveas(fig4set,savePath{1},'emf')
saveas(fig4set,savePath{1},'fig')
drawnow

figure(5)
plot(gaDat.linGen(1,1:end),gaDat.fxmingen(1,1:end),':ks');
title('MinFitnessRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('MinFitnessScore') % y-axis label
fig4set = figure(5);
savePath = strcat(newMeloPath,'gaMin');
saveas(fig4set,savePath{1},'emf')
saveas(fig4set,savePath{1},'fig')
drawnow

figure(6)
plot(gaDat.linGen(1,1:end),gaDat.fitnessTotalgen(1,1:end),':ks');
title('FitnessTotalRevoFinalReport')
xlabel('GenTimes') % x-axis label
ylabel('FitnessTotalScore') % y-axis label
fig4set = figure(6);
savePath = strcat(newMeloPath,'gaTotal');
saveas(fig4set,savePath{1},'emf')
saveas(fig4set,savePath{1},'fig')
drawnow
%{
figure(7)
title('EveryFitnessProgressMapFinalReport')
meshc(gaDat.fitnVGen);
axis tight
drawnow
%}
