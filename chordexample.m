gaDat.Objfun='objfun_chordfit';
%gaDat.Objfun='objfun_schwefel';
%lb=[-500 -500];

%ub=[500 500];
%create  matrix with maximum and minimum 
ub = ones(1,32)*107; % maxium  to octave-3 / C1    middle c is 4 (remember)
lb = ones(1,32)*24; %maximun to octave3 /  C7
gaDat.FieldD=[lb; ub];

gaDat.NIND = 320; %create 320 length per chrosome
gaDat.MAXGEN = 100;
rfMatrix = ones(320,32);
rfCloumn =  (1:gaDat.NIND);

%{
for i = 1 : 32
    rfMatrix(:,i) = rfCloumn ;
end
gaDat.rf = rfMatrix;
%}

gaDat.rf = (1:32)';
%mainmelody create to GADat , make the ga caculating
mainMelodyNeedToTranslate = Mainmelodyimport();
mainMelodyInCreate = Mainmelodytranslate(mainMelodyNeedToTranslate);
gaDat.mainMelodyIngaDat = mainMelodyInCreate;
% Execute GA
gaDat=ga(gaDat);
% Result are in
gaDat.xmin
gaDat.fxmin
