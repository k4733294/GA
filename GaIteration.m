function GaIteration(gaDat)
%  Optional user task executed at the end of each iteration
%

% For instance, results of the iteration
 disp('------------------------------------------------')
 disp(['Iteration: ' num2str(gaDat.gen)])
 disp(['   xmin: ' mat2str(gaDat.xmin) ' -- f(xmin): ',num2str(gaDat.fxmin)])
 disp(['   xmax: ' mat2str(gaDat.xmax) ' -- f(xmax): ',num2str(gaDat.fxmax)])
 
%lineGraphDataX = gaDat.gen;
%lineGraphDataY = gaDat.fxmaxgen;
%set( plotGraph,'XData' , [1:lineGraphDataX] );
%set( plotGraph,'YData', lineGraphDataY );
%refreshdata
%drawnow
 
%% --------------------------------------------------------
