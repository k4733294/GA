function gaDat=ga(g) 
%
% Basic Genetic Algorithm
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
% Grupo de Control Predictivo y Optimizaci�n - CPOH
% Universitat Polit�cnica de Val�ncia.
% http://cpoh.upv.es
% (c) CPOH  1995 - 2012

if nargin==1
    gaDat=g;
else
    error('It is necessary to pass a data structure: gaDat.FieldD and gaDat.Objfun')
end
% If the parameter doesn't exist in the data structure it is created with the default value
if ~isfield(gaDat,'NVAR')
    gaDat.NVAR=size(gaDat.FieldD,2);
end
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
%------------------------
if ~isfield(gaDat,'rf')
   gaDat.rf= (1:gaDat.NIND)';
end


% Internal parameters
gaDat.Chrom=[];
gaDat.ObjV=[];
% attation~~~ the xmin is maximun using in here, checkout !!!@@
gaDat.xmin=[];
gaDat.fxmin=inf;
gaDat.xmax=[];
gaDat.fxmax=1;
gaDat.xmingen=[];
gaDat.fxmingen=[];
gaDat.xmaxgen=[];
gaDat.fxmaxgen=[];
gaDat.gen=0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generation counter
gen=0;

% Initial population      ---------------------------------------
 tempNIND = gaDat.NIND; tempFieldD = gaDat.FieldD;
 TempChrom= crtrp(tempNIND,tempFieldD);
 gaDat.Chrom = TempChrom;
% Real codification
% Individuals of gaDat.indini are randomly added in the initial population

    disp('------------------------------------------------')
    disp('######   if when indini   #########')
    %disp()
    %disp('gadat indini'  , gaDat.indini)
    %disp(['nind0' num2str(nind0)])
    %disp(['posicion0' num2str(posicion0)])
    disp('------------------------------------------------')
    
if not(isempty(gaDat.indini))  %fill with randomly initial data without user insert in gaDat
    nind0=size(gaDat.indini,1);
    posicion0=ceil(rand(1,nind0)*gaDat.NIND);
    gaDat.Chrom(posicion0,:)=gaDat.indini;
end

while (gaDat.gen<gaDat.MAXGEN),
    
    gaDat.gen=gen;
    gaDat=gaevolucion(gaDat);  
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
for i = 1 : 20
    for j = 1 : 16
        minMainMelody(i,j) = gaDat.xmin(i+j);
        maxMainMelody(i,j) = gaDat.xmax(i+j);
    end
end
minMainMelody
maxMainMelody

version = '_minimum';
Melodyexport(minMainMelody,version);
version = '_maximum';
Melodyexport(maxMainMelody,version);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% End main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Present final results

garesults(gaDat)


%% Subfunction  -----------------------------------------


%% ----------------------------------------------------
%{
function chrom=crtrp(Nind,FieldDR)

% A random real value matrix is created coerced by upper and 
% lower bounds


aux = randint(320,32,[36,95]);
                                                    %make the random range form lb to ub with float
                                                    %its good idea to product the rand number 
%{
Nvar = size(FieldDR,2);
aux = rand(Nind,Nvar);
m=[-1 1]*FieldDR;
ublb=ones(Nind,1)*m;
lb=ones(Nind,1)*FieldDR(1,:);  %change the chromesome variable
chrom=ublb.*aux+lb;
%}
chrom=aux;
%}

%% ----------------------------------------------------
function gaDat=gaevolucion(gaDat)
% One generation -------
Chrom=gaDat.Chrom;
%nind=size(Chrom,1);
nind = 20;
ObjV = inf(20,32);

for i = 1: 32 %(population have 32 chromsomes)
    %for j=1:nind %(every chromsome needs to calculating 1times/bar 
                         %so every chromsome totally 20 times needed)
        if isempty(gaDat.ObjfunPar)
            %ObjV(i)=feval(gaDat.Objfun,Chrom(i,:),gaDat.mainMelodyIngaDat(i,:));
           returnToObjV = objfun_chordfit(gaDat.Chrom(:,i),gaDat.mainMelodyIngaDat);
            ObjV(:,i) =  returnToObjV ;
            %A=1; B = 1;
            %objfun_chordfit(A,B);  
        else
            %ObjV(i)=feval(gaDat.Objfun,Chrom(i,:),gaDat.ObjfunPar,gaDat.mainMelodyIngaDat(i,:));
            ObjV(:,i) = objfun_chordfit(Chrom(:,i),gaDat.mainMelodyIngaDat,gaDat.ObjfunPar);
        end
        %disp(['(i:j) is '  , num2str(j)])
        %disp(['ObjV(i:j) ' ,num2str(ObjV(i:j))])
    %end
end
    
    gaDat.ObjV=ObjV;
    sumObjV=sum(ObjV,1);

    % Best individual of the generation -------------------------
    [v,p]=max(sumObjV); %[v,p] is [ value , position ]
    [x,q]=min(sumObjV);
    
    if v>=gaDat.fxmax        % the new maximun replace previous one
        gaDat.xmax=Chrom(:,p);
        gaDat.fxmax=v;
    end
    
    if x<=gaDat.fxmin        % the new minimun replace previous one
        gaDat.xmin=Chrom(:,q);
        gaDat.fxmin=x;
    end
    
    
     % Next
     % generation*******************************************************************
     %SumFitnessinChromesomeBeforeRanking---------------------------------
     for i = 1 : 32  
         objVToSort(i) = sum(gaDat.ObjV(:,i));
     end
     objVToSort = objVToSort' ;
     
     %Ranking-----------------------------------------------------------
     FitnV = ranking(objVToSort,gaDat.rf);
    
    % SELECTION ---------------------------------------------------------
    % Stochastic Universal Sampling (SUS).
    [SelCh,Indices] = select('rws',Chrom,FitnV,1);
    
    % CROSSOVER ---------------------------------------------------
    % Uniform crossover.
    SelCh = lxov(SelCh,gaDat.Pc,gaDat.alfa);
    
    % MUTATION ------------------------------------------------
    SelCh = mutbga(SelCh,gaDat.FieldD,[gaDat.Pm 1]); % Codificaci�n Real.
    
    % Reinsert the best individual  ----------------------------------
    Chrom(:,Indices) = SelCh;
    gaDat.Chrom=Chrom;
    
    % Optional additional task required by user
    gaiteration(gaDat)

%% ---------------------------------------------------------
function FitV=ranking(ObjV,RFun)
% Ranking function
if nargin==1
    error('Ranking function needs two parameters');
end

if ~(length(ObjV(:,1))==length(RFun))
    error('RFun have to be of the same size than ObjV.');
end

% (sum the fitness from every part of chromesome in 32 block(chromesome))
[val,pos]=sort(ObjV);
FitV(pos)=flipud(RFun);
FitV=FitV';

%% ---------------------------------------------------------
function [SelCh,Indices]=select(SEL_F, Chrom, FitnV, GGAP)
% Selection Function
if (nargin==3) %  No overlap -------------------
    if (SEL_F=='rws')
        % Roulette wheel selection method
        indices=rws(FitnV,length(FitnV));
        SelCh=Chrom(indices,:);
    elseif (SEL_F=='sus')
        % Stochastic unversal sampling selection
        indices=sus(FitnV,length(FitnV));
        
        SelCh=Chrom(indices,:);
    else
        error('Incorrect selection method');
    end
elseif (nargin==4) % With overlap -----------------------------
	% Indexes of new individuals
    if (SEL_F=='rws')
        indices=rws2(FitnV,round(length(FitnV)*GGAP));
    elseif (SEL_F=='sus')
        indices=sus2(FitnV,round(length(FitnV)*GGAP));
       
    else
        error('Incorrect selection method');
    end

    if (GGAP<1) % there is overlap
        % Members of the population to overlap
        oldpos=(1:length(FitnV))';
        for k=1:length(FitnV)
            pos=round(rand*length(FitnV)+0.5);
            % exchange indexes
            oldpos([pos k])=oldpos([k pos]);
        end
        oldpos=oldpos(1:round(length(FitnV)*GGAP));
        SelCh=Chrom;
        SelCh(oldpos,:)=Chrom(indices,:);
    else % more childs than parents
        SelCh=Chrom(:,indices);
        Indices=indices;
    end
else
    error('Incorrect number of paramenters');
end

% Disorder the population. 
%{
[kk,indi]=sort(rand(length(FitnV),1));
SelCh=SelCh(:,indi); 
%}

%% ------------------------------------------------------------------
%{
function NewChrom =lxov(OldChrom, XOVR, alpha)
% Linear crossover
% Produce a new population by linear crossover and XOVR crossover probability
%   NewChroms =lxov(OldChrom, XOVR, alpha, FieldDR)
%
% Linear recombination.
% Parameters 'beta1' and 'beta2' are randomly obtained inside [-alpha, 1+alpha]
% interval
%   Child1 = beta1*Parent1+(1-beta1)*Parent2
%   Child2 = beta2*Parent1+(1-beta2)*Parent2

if nargin==1
    XOVR = 0.7;
    alpha = 0;
elseif nargin==2
    alpha = 0;
end

n = size(OldChrom,1);   % Number of individuals and chromosome length
npares = floor(n/2);    % Number of pairs
cruzar = rand(npares,1)<= XOVR;    % Pairs to crossover
NewChrom=OldChrom;

for i=1:npares
    pin = (i-1)*2+1;
    if ~(cruzar(i)==0)
        betas=rand(2,1)*(1+2*alpha)-(0.5+alpha);
        A=[betas(1) 1-betas(1); 1-betas(2) betas(2)];
        NewChrom(pin:pin+1,:)=A*OldChrom(pin:pin+1,:);
    end
end

% Coerce points outside search space
% aux = ones(n,1);
% auxf1=aux*FieldDR(1,:);
% auxf2=aux*FieldDR(2,:);
% NewChrom = (NewChrom>auxf2).*auxf2+(NewChrom<auxf1).*auxf1+(NewChrom<=auxf2 & NewChrom>=auxf1).*NewChrom;
%}
%% -------------------------------------------------------------
%{
function NewChrom=mutbga(OldChrom,FieldDR,MutOpt)
% Mutation function
% Real coded mutation. 
% Mutation is produced adding a low random value
% OldChrom: Initial population.
% FieldChrom: Upper and lower bounds.
% MutOpt: mutation options,
%         MutOpt(1)=mutation probability (0 to 1).
%         MutOpt(2)=compression of the mutation value (0 to 1).
%         default MutOpt(1)=1/Nvar y MutOpt(2)=1

if (nargin==3)
    pm=MutOpt(1);
    shr=MutOpt(2);
elseif (nargin==2)
    pm=1/size(FieldDR,2);
    shr=1;
else
    error('Incorrect number of parameters');
end

Nind=size(OldChrom,1);
m1=0.5-(1-pm)*0.5;
m2=0.5+(1-pm)*0.5;
aux=rand(size(OldChrom));
MutMx=(aux>m2)-(aux<m1);
range=[-1 1]*FieldDR*0.5*shr;
range=ones(Nind,1)*range;
index=find(MutMx); 
m=20;
alpha=rand(m,length(index))<(1/m);
xx=2.^(0:-1:(1-m));
aux2=xx*alpha;
delta=zeros(size(MutMx));
delta(index)=aux2;
NewChrom=OldChrom+(MutMx.*range.*delta);

% Coerce points outside bounds
aux = ones(Nind,1);
auxf1=aux*FieldDR(1,:);
auxf2=aux*FieldDR(2,:);

NewChrom1 =(NewChrom<=auxf2 & NewChrom>=auxf1);

NewChrom = (NewChrom>auxf2).*auxf2+(NewChrom<auxf1).*auxf1+(NewChrom<=auxf2 & NewChrom>=auxf1).*NewChrom;
%}
%% ----------------------------------------------------------
function NewChrIx=sus2(FitnV, Nsel)
%indices=sus2(FitnV,round(length(FitnV)*GGAP));

 
suma=sum(FitnV);   

% Position of the roulette pointersXS
j=0;
sumfit=0; 
paso=suma/Nsel; % distance between pointers
flecha=rand*paso; % offset of the first pointer

NewChrIx(Nsel,1)=0; 

for i=1:Nsel
    sumfit=sumfit+FitnV(i);
   
    while (sumfit>=flecha)
        j=j+1;
        NewChrIx(j)=i;
        
        flecha=flecha+paso;
        
    end
end

%% --------------------------------------------------------
function NewChrlx=rws2(FitnV,Nsel)


choicednum=2;
suma = sum(FitnV);

sumfit(1)= FitnV(1)/suma;
for i=2:Nsel
    sumfit(i) = sumfit(i-1) + FitnV(i)/suma;
end

NewChrlx(Nsel,1) = 0;
selFitnV=randi([1 100],1,choicednum);
selFitnV=selFitnV/100;

for j= 1:choicednum
    search = selFitnV(j);
    find = binarysearch(sumfit,search,Nsel);
    selFinVfind(j)=find;
end

NewChrlx = selFinVfind;

function find=binarysearch(sumfit,search,Nsel)

low =1;
high = Nsel -1;

% Testing-------------------------
%{
high
search
sumfit
%}

while(low<=high)
    mid = (low + high) / 2;
    %mid
    if (sumfit(mid)>search)
        
        if (mid == low)
              find = mid ; 
        else    
            midlow= mid-1;
            if (sumfit(midlow)<search)
                find = mid ; 
                  %find
            break
            end
        end
        
        high = mid -1;
        
    elseif (sumfit(mid)<search)
        
        if(mid == high)
            find = high;
        else
            midlow= mid+1;
            if (sumfit(midlow)>search)
                find = mid ; 
            break
            end
        end
        
        low = mid +1;
    end
end
















%%------------------------------------------------------------