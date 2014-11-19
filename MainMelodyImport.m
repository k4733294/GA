function gaDat = MainMelodyImport()

gaDat.Objfun='Objfunchordfit';
%gaDat.Objfun='objfun_schwefel';
%lb=[-500 -500];
%ub=[500 500];
%create  matrix with maximum and minimum                

%% ////mainMelodyimport////
%----------------------------------------------------------
%% mainmelody create to GADat , make the ga caculating
%%{
mainImportInfo.Objfun = 'mainMelody';
mainImportInfo.midiString = 'pitbull-timber_ft_kesha.mid';
mainImportInfo.mainOrChord =0; % 0 = main melody 1=import chord melody
mainImportInfo.track = 6;
mainImportInfo.howManyMeasureWeWant = 8;
mainImportInfo.whichMeasureWeStart = 3;
mainImportInfo.rhythm = 1;
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.cosTonal(1,1)=1;
mainImportInfo.cosTonal(2,1)=1;
version = 'pitbull-timber_Output';
mainImportInfo.exportVersion=version;
mainImportInfo = Variabledefine(mainImportInfo,mainImportInfo.rhythm);
Melodyexport(mainImportInfo,version);
%}
%% //////adjust///////////
%--------------------------------------------------
%the population pool
gaDat.populationSize = 100;
%how many time will generate
gaDat.MAXGEN = 100;
%tonal means : major note  default  65F 64E 62D 60C 59B 57A 55G 
gaDat.majorNote = 57;
%chromesomeLength
gaDat.blockSize = 2;
%%how many measure in oneblock
%??BLOCK??1?4/4???
%?? mainImportInfo.howManyMeasureWeWant ????
%????????Measure?? ???BLOCK??????
%?POPULATION????
gaDat.howManyMeasureInOneBlock = 2;

%//////////////////////
%------------------------------------------------
%% create size of numbers in the bar  which is the same length with others 
measureLength = mainImportInfo.notesInTheMeasure(end,1);
gaDat.barSize = numel(measureLength);
%% create number of the bar  which is the same length with others 
gaDat.barNum= mainImportInfo.howManyMeasureWeWant;
%% createmeasureLengthNoteNum total length of the chrosome  is the same length with others 
% ATTATION --- here we need to change the evalute variable
gaDat.NIND = numel(mainImportInfo.notesInTheMeasure); 
%% evaluation in the ranking function
gaDat.rf = (1:gaDat.populationSize)';
%evaluation in the objfun  
    %ub = ones(1,psize)*107; % maxium  to octave-3 / C1    middle c is 4 (remember)
    %lb = ones(1,psize)*24; %maximun to octave3 /  C7
    %gaDat.FieldD=[lb; ub];                                 
gaDat.mainImportInfo=mainImportInfo;
gaDat.NoteInfoNum=9;