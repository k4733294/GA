function gaDatPlot(gaDat)
gen = gaDat.gen;
figure(1)
plot(gaDat.linGen(1,1:gen),gaDat.fxmaxgen(1,1:gen),':ks');
title('MaxFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('MaxFitnessScore') % y-axis label
drawnow
figure(2)
plot(gaDat.linGen(1,1:gen),gaDat.fxmingen(1,1:gen),':ks');
title('MinFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('MinFitnessScore') % y-axis label
drawnow
figure(3)
plot(gaDat.linGen(1,1:gen),gaDat.fitnessTotalgen(1,1:gen),':ks');
title('TotalFitnessRevo')
xlabel('GenTimes') % x-axis label
ylabel('TotalFitnessScore') % y-axis label
drawnow