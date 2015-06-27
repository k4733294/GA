function gaDat=Ga(g) 

%% Basic Genetic Algorithm
% 
% 
%gaDat=ga(gaDat)
%gaDat : Data structure used by the algorithm.
%    
% Data structure:
% Parameters that have to be defined by user
% gaDat.FieldD=[lb; ub]; % lower (lb) and upper (up) bounds of the search space. 
%                        % each dimension of the search space requires bounds 
% gaDat.Objfun='costFunction'; % Name of the 0bjective function to be minimize
% 
% Parameters that could be defined by user, in other case, there is a default value
% gaDat.MAXGEN={gaDat.NVAR*20+10}; % Number of generation, gaDat.NVAR*20+10 by default
% gaDat.NIND={gaDat.NVAR*50} ;   % Size of the population, gaDat.NVAR*50 by default
% gaDat.alfa={0};                % Parameter for linear crossover, 0 by default
% gaDat.Pc={0.9};                % Crossover probability, 0.9 by default
% gaDat.Pm={0.1};                % Mutation probability, 0.1 by default
% gaDat.ObjfunPar={[]};          % Additional parameters of the objective function
%                                %  have to be packed in a structure, empty by default
% gaDat.indini={[]};             % Initialized members of the initial population, empty
%                                %  by default
%
% Grupo de Control Predictivo y Optimizaci???n - CPOH
% Universitat Polit???cnica de Val???ncia.
% http://cpoh.upv.es
% (c) CPOH  1995 - 2012
%%{
if nargin==1
    gaDat=g;
else
    error('It is necessary to pass a data structure: gaDat.FieldD and gaDat.Objfun')
end
%}
%%  If the parameter doesn't exist in the data structure it is created with the default value
%{
if ~isfield(gaDat,'NVAR')
    gaDat.NVAR=size(gaDat.FieldD,2);
end
if ~isfield(gaDat,'NIND')
    gaDat.NIND=gaDat.NVAR*50;
end  
%}
%%{
if ~isfield(gaDat,'Pc')
    gaDat.Pc=0.9;
end
if ~isfield(gaDat,'Pm')
    gaDat.Pm=0.1;
end
if ~isfield(gaDat,'ObjfunPar')
    gaDat.ObjfunPar=[];
end
if ~isfield(gaDat,'MAXGEN')
    gaDat.MAXGEN=gaDat.NVAR*20+10;
end
if ~isfield(gaDat,'alfa')
    gaDat.alfa=0;
end
if ~isfield(gaDat,'indini')
    gaDat.indini=[];
end
if ~isfield(gaDat,'rf')
   gaDat.rf= (1:gaDat.NIND)';
end
%}

%}
%%  Internal parameters
gaDat.xmin=[];
gaDat.fxmin=inf;
gaDat.xmax=[];
gaDat.fxmax=1;
gaDat.xmingen=[];
gaDat.fxmingen=[];
gaDat.xmaxgen=[];
gaDat.fxmaxgen=[];
gaDat.fitnessTotalgen=[];
gaDat.gen=0;
gaDat.linGen = linspace(1,gaDat.MAXGEN,gaDat.MAXGEN);
 gaDat.sfcDensityWeightVarGen = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;
% Generation counter
gen = 1;
% Initial population -------------------------------------------
gaDat = Crtrp(gaDat);
%{
%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/johnLegenAllOfMeFinishCrtrp2000.mat');
%load('C:\Users\lab1421\Documents\MATLAB\GA\struct_data\johnLegenAllOfMeFinishCrtrp2000.mat');
%NewMeloPath = CreateNewFolderForMeloChrom(gaDat);
%}
savePath = strcat(gaDat.newMeloPathBefore,'gaDatBefore.mat');
save(savePath{1},'gaDat');
gaDat = ChromsomeExport(gaDat,gaDat.newMeloPathBefore);
%{
for i =1 : gaDat.populationSize
    gaDat.chromsome(1,i ).ticksPerQuarterNote = gaDat.mainImportInfo.ticksPerQuarterNote;
end
%}
% Algorithm Kernel using later-------------------------------------------
disp('######   StartGaAlgorithmHere   #########')
while (gaDat.gen<gaDat.MAXGEN),
    gaDat.gen = gen;
    gaDat = Gaevolucion(gaDat);
    % Increase generation counter
    gaDat.xmingen(1,gen)=gaDat.xmin;
    gaDat.fxmingen(1,gen)=gaDat.fxmin;
    gaDat.xmaxgen(1,gen)=gaDat.xmax;
    gaDat.fxmaxgen(1,gen)=gaDat.fxmax;
    gaDat.fitnessTotalgen(1,gen)=gaDat.fitnVTotal;
    if gen>1
        gaDat.sfcDensityWeightVarGen1(1,gen) = gaDat.sfcDensityWeightVar1;
        gaDat.sfcDensityWeightVarGen2(1,gen) = gaDat.sfcDensityWeightVar2;
        gaDat.patternNameSmoothScoreGen1(1,gen) = gaDat.patternNameSmoothScore1;
        gaDat.patternNameSmoothScoreGen2(1,gen) = gaDat.patternNameSmoothScore2;
        gaDat.measureSmoothScoreGen1(1,gen) = gaDat.measureSmoothScore1;
        gaDat.measureSmoothScoreGen2(1,gen) = gaDat.measureSmoothScore2;
        gaDat.sfcBassLevelWeightGen1(1,gen) = gaDat.sfcBassLevelWeight1;
        gaDat.sfcBassLevelWeightGen2(1,gen) = gaDat.sfcBassLevelWeight2;
        gaDat.sfcChorusDensityWeightAvgGen1(1,gen) = gaDat.sfcChorusDensityWeightAvg1;
        gaDat.sfcChorusDensityWeightAvgGen2(1,gen) = gaDat.sfcChorusDensityWeightAvg2;
        gaDat.sfcVerseDensityWeightAvgGen1(1,gen) = gaDat.sfcVerseDensityWeightAvg1;
        gaDat.sfcVerseDensityWeightAvgGen2(1,gen) = gaDat.sfcVerseDensityWeightAvg2;
    end
    gaDatPlot(gaDat);
    gen = gen + 1;
end
%% Export the garesult matix in to midi struct-------------------
savePath = strcat(gaDat.newMeloPathFinish,'gaDatFinal.mat');
save(savePath{1},'gaDat');
gaDat = ChromsomeExport(gaDat,gaDat.newMeloPathFinish);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Present final results
t=toc;
GaResults(gaDat,t,gaDat.newMeloPathFinish)


% Disorder the population. 
%{
[kk,indi]=sort(rand(length(FitnV),1));
SelCh=SelCh(:,indi); 
%}

