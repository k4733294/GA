function gaDat=Ga(g) 

%% Basic Genetic Algorithm
% 
% 
%    gaDat=ga(gaDat)
%    gaDat : Data structure used by the algorithm.
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

if nargin==1
    gaDat=g;
else
    error('It is necessary to pass a data structure: gaDat.FieldD and gaDat.Objfun')
end
%%  If the parameter doesn't exist in the data structure it is created with the default value
%{
if ~isfield(gaDat,'NVAR')
    gaDat.NVAR=size(gaDat.FieldD,2);
end
%}

if ~isfield(gaDat,'MAXGEN')
    gaDat.MAXGEN=gaDat.NVAR*20+10;
end
if ~isfield(gaDat,'NIND')
    gaDat.NIND=gaDat.NVAR*50;
end  
if ~isfield(gaDat,'alfa')
    gaDat.alfa=0;
end
if ~isfield(gaDat,'Pc')
    gaDat.Pc=0.9;
end
if ~isfield(gaDat,'Pm')
    gaDat.Pm=0.1;
end
if ~isfield(gaDat,'ObjfunPar')
    gaDat.ObjfunPar=[];
end
if ~isfield(gaDat,'indini')
    gaDat.indini=[];
end
if ~isfield(gaDat,'rf')
   gaDat.rf= (1:gaDat.NIND)';
end

%%  Internal parameters
gaDat.Chrom=[];
gaDat.ObjV=[];
gaDat.xmin=[];
gaDat.fxmin=inf;
gaDat.xmax=[];
gaDat.fxmax=1;
gaDat.xmingen=[];
gaDat.fxmingen=[];
gaDat.xmaxgen=[];
gaDat.fxmaxgen=[];
gaDat.gen=0;
gaDat.rhythm=[];
y=0;
x=0;
figure;
plotGraph=plot(x,y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic;
% Generation counter
gen=0;
% Initial population
% -------------------------------------------
 gaDat= Crtrp(gaDat);
 %-------------------------------------------
 % Individuals of gaDat.indini are randomly added in the initial population
 %{
    disp('------------------------------------------------')
    disp('######   if when indini   #########')
    disp()
    disp('gadat indini'  , gaDat.indini)
    disp(['nind0' num2str(nind0)])
    disp(['posicion0' num2str(posicion0)])
    disp('------------------------------------------------')
 %}
% Algorithm Kernel using later 
disp('######   StartGaAlgorithmHere   #########')
while (gaDat.gen<gaDat.MAXGEN),
    gaDat.gen=gen;
    gaDat=Gaevolucion(gaDat,plotGraph);  
   % Increase generation counter ------------------
    gaDat.xmingen(:,gen+1)=gaDat.xmin;
    gaDat.fxmingen(:,gen+1)=gaDat.fxmin;
    gaDat.xmaxgen(:,gen+1)=gaDat.xmax;
    gaDat.fxmaxgen(:,gen+1)=gaDat.fxmax;
    gen=gen+1;
end
%export the garesult matix in to midi struct-------------------    
%------num is version of file------------------------------
minMainMelody = [];
maxMainMelody = [];
%%{
%ATTATION every important part must unmute.  here is servival part
for i = 1 : 20
    for j = 1 : 16
        minMainMelody(i,j) = gaDat.xmin(i+j);
        maxMainMelody(i,j) = gaDat.xmax(i+j);
    end
end
%}
version = '_testMidiToMidiOutput';
Melodyexport(gaDat.mainImportInfo,version);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Present final results
t=toc;
GaResults(gaDat,t)

% Disorder the population. 
%{
[kk,indi]=sort(rand(length(FitnV),1));
SelCh=SelCh(:,indi); 
%}

