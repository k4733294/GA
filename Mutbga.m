function selChMutaChoice = Mutbga(selChMutaChoice,IndicesMuta,gaDat)
%{
% Mutation function
% Real coded mutation. 
% Mutation is produced adding a low random value
% OldChrom: Initial population.
% FieldChrom: Upper and lower bounds.
% MutOpt: mutation options,
%         MutOpt(1)=mutation probability (0 to 1).
%         MutOpt(2)=compression of the mutation value (0 to 1).
%         default MutOpt(1)=1/Nvar y MutOpt(2)=1
%}
pm = gaDat.Pm;
pm = pm{1}*100;
chorusPoint = gaDat.mainImportInfo.chorusPoint;
startChorus = chorusPoint(1,1);
endChorus = chorusPoint(1,2);
startMeasre = 0;
endMeasure = 0;
mutaAct = 0;
%%do Muta Or not
mutaActRand = randi([1 100],1);
%% 1 make note length be long passing from same length 
%    2 make note length be long passing from randNoteLength
%    3 make note length be short passing from same length
%    4 make note length be short passing from randNoteLength
randMode = randi([1 4],1);
%randMode = 3;
%%{
%% 1  1/2note length
%    2   1/4note length
%    3   1/8note length
%    4   1/16note length
%%{
randNoteLengthMode = randi([1 3],1);
NoteLengthMatrix = [1 2 3  ;8 4 2 ] ;
randNoteLength = NoteLengthMatrix(2,randNoteLengthMode);
%}
%randNoteLength = 2;
%}
%% 1 verse do 
%    2 chrous do
randVerseOrChrous = randi([1 2],1);
%%
%mutaAct = 1;
%%{
if mutaActRand <= pm
    mutaAct = 1;
end
%}

sizeOfMeasure= size(selChMutaChoice.measure,2);
if randVerseOrChrous == 1
    startMeasre = 1;
    endMeasure = sizeOfMeasure;
else
    startMeasre = startChorus;
    endMeasure = endChorus;
end

if mutaAct == 1
    for pMeasure = startMeasre : endMeasure
        if randVerseOrChrous == 1 
            if pMeasure < endChorus && pMeasure > startChorus
                selChMutaChoice = PatternMutbgaFix(selChMutaChoice,gaDat,pMeasure,IndicesMuta,randNoteLength,randMode);
                %gaDat = PatternMutbga(gaDat,pMeasure,IndicesMuta,randNoteLength,randMode);
                selChMutaChoice.measure(1,pMeasure).patternVariance = selChMutaChoice.measure(1,pMeasure).patternVariance+1;
            else
                continue
            end
        else
            selChMutaChoice = PatternMutbgaFix(selChMutaChoice,gaDat,pMeasure,IndicesMuta,randNoteLength,randMode);
            selChMutaChoice.measure(1,pMeasure).patternVariance = selChMutaChoice.measure(1,pMeasure).patternVariance+1;
        end
    end
end
selChMutaChoice = MutaRestruct(selChMutaChoice,gaDat,IndicesMuta);


%{
if (nargin==3)
    pm=MutOpt(1);
    shr=MutOpt(2);
elseif (nargin==2)
    pm=1/size(FieldDR,2);
    shr=1;
else
    error('Incorrect number of parameters');
end

for i = 1 : 2
whoNeedMut = randi([1 320],1,1);
OldChrom(whoNeedMut,i) = randi([36 84],1,1);
end

NewChrom = OldChrom;

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

%OldChrom
%NewChrom
NewChrom = (NewChrom>auxf2).*auxf2+(NewChrom<auxf1).*auxf1+(NewChrom<=auxf2 & NewChrom>=auxf1).*NewChrom;
%}

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