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
if gaDat.gen > 1
    figure(7)
    plot(gaDat.linGen(1,2:gen),gaDat.sfcDensityWeightVarGen1(1,2:gen),gaDat.linGen(1,2:gen),gaDat.sfcDensityWeightVarGen2(1,2:gen));
    legend('sfcDensityWeightVarGen1','sfcDensityWeightVarGen2')
    legend boxoff
    box off
    title('sfcDensityWeightVar')
    xlabel('GenTimes') % x-axis label
    ylabel('sfcDensityWeightVar') % y-axis label
    drawnow
    
    figure(8)
    plot(gaDat.linGen(1,2:gen),gaDat.patternNameSmoothScoreGen1(1,2:gen),gaDat.linGen(1,2:gen),gaDat.patternNameSmoothScoreGen2(1,2:gen));
    legend('patternNameSmoothScoreGen1','patternNameSmoothScoreGen2')
    legend boxoff
    box off
    title('patternNameSmoothScore')
    xlabel('GenTimes') % x-axis label
    ylabel('patternNameSmoothScore') % y-axis label
    drawnow
    
    figure(9)
    plot(gaDat.linGen(1,2:gen),gaDat.measureSmoothScoreGen1(1,2:gen),gaDat.linGen(1,2:gen),gaDat.measureSmoothScoreGen2(1,2:gen));
    legend('measureSmoothScoreGen1','measureSmoothScoreGen2')
    legend boxoff
    box off
    title('measureSmoothScore')
    xlabel('GenTimes') % x-axis label
    ylabel('measureSmoothScore') % y-axis label
    drawnow
    
    figure(10)
    plot(gaDat.linGen(1,2:gen),gaDat.sfcBassLevelWeightGen1(1,2:gen),gaDat.linGen(1,2:gen),gaDat.sfcBassLevelWeightGen2(1,2:gen));
    legend('sfcBassLevelWeightGen1','sfcBassLevelWeightGen2')
    legend boxoff
    box off
    title('sfcBassLevelWeightGen')
    xlabel('GenTimes') % x-axis label
    ylabel('sfcBassLevelWeightGen1') % y-axis label
    drawnow
    
    figure(11)
    plot(gaDat.linGen(1,2:gen),gaDat.sfcChorusDensityWeightAvgGen1(1,2:gen),gaDat.linGen(1,2:gen),gaDat.sfcChorusDensityWeightAvgGen2(1,2:gen));
    legend('sfcChorusDensityWeightAvgGen1','sfcChorusDensityWeightAvgGen2')
    legend boxoff
    box off
    title('sfcChorusDensityWeightAvgGen')
    xlabel('GenTimes') % x-axis label
    ylabel('sfcChorusDensityWeightAvgGen') % y-axis label
    drawnow
    
    figure(12)
    plot(gaDat.linGen(1,2:gen),gaDat.sfcVerseDensityWeightAvgGen1(1,2:gen),gaDat.linGen(1,2:gen),gaDat.sfcVerseDensityWeightAvgGen1(1,2:gen));
    legend('sfcVerseDensityWeightAvgGen1','sfcVerseDensityWeightAvgGen2')
    legend boxoff
    box off
    title('sfcVerseDensityWeightAvgGen')
    xlabel('GenTimes') % x-axis label
    ylabel('sfcVerseDensityWeightAvgGen') % y-axis label
    drawnow
end