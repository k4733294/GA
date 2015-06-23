function gaDatPlot(gaDat)
gen = gaDat.gen;
figure(1)
title('MaxFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('MaxFitnessScore') % y-axis label
plot(gaDat.linGen(1,1:gen),gaDat.fxmaxgen(1,1:gen),':ks');
drawnow
figure(2)
title('MinFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('MinFitnessScore') % y-axis label
plot(gaDat.linGen(1,1:gen),gaDat.fxmingen(1,1:gen),':ks');
drawnow
figure(3)
title('TotalFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('TotalFitnessScore') % y-axis label
plot(gaDat.linGen(1,1:gen),gaDat.fitnessTotalgen(1,1:gen),':ks');
drawnow