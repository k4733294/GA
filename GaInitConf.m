function gaDat = GaInitConf(gaDat)

gaDat.Objfun='Objfunchordfit';
%gaDat.Objfun='objfun_schwefel';
%lb=[-500 -500];
%ub=[500 500];
%create  matrix with maximum and minimum                

%% //////adjust///////////
%the population pool
gaDat.populationSize = 200;
%how many time will generate
gaDat.MAXGEN = 500;
%tonal means : major note  default  65F 64E 62D 60C 59B 57A 55G 
%gaDat.majorNote = 57;
%%how many measure in oneblocks
%gaDat.howManyMeasureInOneBlock = 2;

%% create size of numbers in the bar  which is the same length with others 
%measureLength = gaDat.mainImportInfo.notesInTheMeasure(end,1);
%gaDat.barSize = numel(measureLength);
%% create number of the bar  which is the same length with others 
%gaDat.barNum= gaDat.mainImportInfo.howManyMeasureWeWant;
%% createmeasureLengthNoteNum total length of the chrosome  is the same length with others 
% ATTATION --- here we need to change the evalute variable
gaDat.NIND = numel(gaDat.mainImportInfo.notesInTheMeasure); 
%% evaluation in the ranking function
gaDat.rf = (1:gaDat.populationSize)';
gaDat.dialogLength = 16;
gaDat.patternLength = 4;


%evaluation in the objfun  
%ub = ones(1,psize)*107; % maxium  to octave-3 / C1    middle c is 4 (remember)
%lb = ones(1,psize)*24; %maximun to octave3 /  C7
%gaDat.FieldD=[lb; ub];   