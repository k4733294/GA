gaDat.Objfun='objfun_Chordfit';
%gaDat.Objfun='objfun_schwefel';
%lb=[-500 -500];
%ub=[500 500];
%create  matrix with maximum and minimum 


%////mainMelodyimport////
%----------------------------------------------------------
%mainmelody create to GADat , make the ga caculating
mainMelodyNeedToTranslate = Mainmelodyimport();
mainMelodyInCreate = Mainmelodytranslate(mainMelodyNeedToTranslate);
gaDat.mainMelodyIngaDat = mainMelodyInCreate;
%-------------------------------------------------------------

%/////adjust//////
%-------------------------------------------------------------
%the population pool
psize = 100;
gaDat.populationSize = psize;
%how many time will generate
gaDat.MAXGEN = 1000;
%tonal means : major note  default  65F 64E 62D 60C 59B 57A 55G 
gaDat.majorNote = 57;
%-------------------------------------------------------------
%create size of numbers in the bar  which is the same length with others 
gaDat.barSize = numel(mainMelodyInCreate(1,:));
%create number of the bar  which is the same length with others 
gaDat.barNum= numel(mainMelodyInCreate(:,1));
%create total length of the chrosome  is the same length with others 
gaDat.NIND = numel(mainMelodyInCreate); 
%evaluation in the ranking function
gaDat.rf = (1:psize)';
%evaluation in the objfun  
ub = ones(1,psize)*107; % maxium  to octave-3 / C1    middle c is 4 (remember)
lb = ones(1,psize)*24; %maximun to octave3 /  C7
gaDat.FieldD=[lb; ub];                                 

% ////Execute GA/////
%---------------------------------------------------------------
gaDat=Ga(gaDat);
% Result are in
