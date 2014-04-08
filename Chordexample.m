gaDat.Objfun='objfun_chordfit';
%gaDat.Objfun='objfun_schwefel';
%lb=[-500 -500];

%ub=[500 500];
%create  matrix with maximum and minimum 
psize = 100;
gaDat.barsize = 16;
gaDat.barnum= 20;
gaDat.populationsize = psize;

ub = ones(1,psize)*107; % maxium  to octave-3 / C1    middle c is 4 (remember)
lb = ones(1,psize)*24; %maximun to octave3 /  C7
gaDat.FieldD=[lb; ub];
gaDat.NIND = 320; %create 320 length per chrosome
gaDat.MAXGEN = 1000;
gaDat.rf = (1:psize)';

%tonal means : major note
%{
65 F
64 E
62 D
60 C
59 B
57 A
55 G
%}
gaDat.majorNote = 57;

%mainmelody create to GADat , make the ga caculating
mainMelodyNeedToTranslate = Mainmelodyimport();
mainMelodyInCreate = Mainmelodytranslate(mainMelodyNeedToTranslate);
gaDat.mainMelodyIngaDat = mainMelodyInCreate;

% Execute GA
gaDat=Ga(gaDat);
% Result are in
