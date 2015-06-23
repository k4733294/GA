function GaIteration(gaDat)
%  Optional user task executed at the end of each iteration
% For instance, results of the iteration
disp('------------------------------------------------')
disp(['Iteration: ' num2str(gaDat.gen)])
disp(['   minChromIndex: ' mat2str(gaDat.xmin) ' -- minScore: ',num2str(gaDat.fxmin)])
disp(['   maxChromIndex: ' mat2str(gaDat.xmax) ' -- maxScore: ',num2str(gaDat.fxmax)])
disp(['   TotalFitnessScore: ' mat2str(gaDat.fitnVTotal) ])

%{
hold on
figure(4)
title('EveryFitnessProgressMap')
if size(gaDat.fitnVGen,2) ~= 1
    meshc(gaDat.fitnVGen);
    axis tight
end
hold off
drawnow
%}
