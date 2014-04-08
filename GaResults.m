function GaResults(gaDat,t)
% Optional user task executed when the algorithm ends

% For instance, final result
disp('------------------------------------------------')
disp('######   RESULT   #########')
disp(['   Objective function for xmin: ' num2str(gaDat.fxmin)])
disp(['   xmin: ' mat2str(gaDat.xmin)])
disp('------------------------------------------------')
disp(['  total time:  ' num2str(t)])
x = 1:500;
y = gaDat.fxmaxgen;
figure
plot(x,y)