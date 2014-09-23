gaDat.Objfun='Objfunchordfit';
%gaDat.Objfun='objfun_schwefel';
%lb=[-500 -500];
%ub=[500 500];
%create  matrix with maximum and minimum                


%////mainMelodyimport////
%----------------------------------------------------------
%mainmelody create to GADat , make the ga caculating
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = '/Users/hooshuu/Music/midi/pitbull-timber_ft_kesha.mid';
mainImportInfo.mainOrChord=0; % 0 = main melody 1=import chord melody
mainImportInfo.track=6;
mainImportInfo.howManyMeasureWeWant=8;
mainImportInfo.whichMeasureWeStart=3;
mainImportInfo.rhythm=1;
mainImportInfo.blockSize=2;
mainImportInfo=RhythmImport(mainImportInfo);
%gaDat.mainMelodyIngaDat = mainMelodyInCreate;
%-------------------------------------------------------------

%//////adjust//////
%-------------------------------------------------------------
%the population pool
psize = 5;
gaDat.populationSize = psize;
%how many time will generate
gaDat.MAXGEN = 100;
%tonal means : major note  default  65F 64E 62D 60C 59B 57A 55G 
gaDat.majorNote = 57;
%-------------------------------------------------------------
%create size of numbers in the bar  which is the same length with others 
measureLength = mainImportInfo.notesInTheMeasure(end,1);
gaDat.barSize = numel(measureLength);
%create number of the bar  which is the same length with others 
gaDat.barNum= mainImportInfo.howManyMeasureWeWant;
%create total length of the chrosome  is the same length with others 
%%ATTATION --- here we need to change the evalute variable
gaDat.NIND = numel(mainImportInfo.notesInTheMeasure); 
%evaluation in the ranking function
gaDat.rf = (1:psize)';
%evaluation in the objfun  
ub = ones(1,psize)*107; % maxium  to octave-3 / C1    middle c is 4 (remember)
lb = ones(1,psize)*24; %maximun to octave3 /  C7
gaDat.FieldD=[lb; ub];                                 
gaDat.mainImportInfo=mainImportInfo;
gaDat.NoteInfoNum=9;
% ////Execute GA/////
%---------------------------------------------------------------
gaDat=Ga(gaDat);
% Result are in
