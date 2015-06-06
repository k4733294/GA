function gaDat = lxov(selChXovFst,selChXovSnd,IndicesFst,IndicesSnd,gaDat)
XOVR = gaDat.Pc;
alpha = gaDat.alfa;

mixMap = MixMapCreate();
mixMapChoice = mixMapRandChoiced(mainMeasureNumProperty,mixMap);
mixMapChoice = mixMapPartionWeight(mixMapChoice);
gaDat = IxovExcute(mixMapChoice,selChXovSnd,selChXovFst,IndicesFst,IndicesSnd,gaDat);

%dialog change here
%one (DIALOG)consist of 4 block (a block represent measure)
%{
choiceDialog = randi([1,2]);
pointStart = 1;
pointEnd = 1;

if choiceDialog == 1 
   pointStart = 1;
   pointEnd = 4;
else
   pointStart = pointStart*4;  %4 represent the  how many BLOCK in one dialog
   pointEnd = (pointStart+1)*4;
   pointStart = pointStart+1; %forward the index  1 2 3 4   (4->"5") 6 7 8   (8->"9") 10 11 12
end

%cross CHROMSOME here
temp=OldChrom(2,pointStart:pointEnd);
OldChrom(2,pointStart:pointEnd)=OldChrom(1,pointStart:pointEnd);
OldChrom(1,pointStart:pointEnd)=temp;


NewChrom=OldChrom;
%}
% Linear crossover
% Produce a new population by linear crossover and XOVR crossover probability
%   NewChroms =lxov(OldChrom, XOVR, alpha, FieldDR)
%
% Linear recombination.
% Parameters 'beta1' and 'beta2' are randomly obtained inside [-alpha, 1+alpha]
% interval
%   Child1 = beta1*Parent1+(1-beta1)*Parent2
%   Child2 = beta2*Parent1+(1-beta2)*Parent2

%%old GA CROSSOVER stratage
%{ 
length = barsize;

if nargin==1
    XOVR = 0.7;
    alpha = 0;
elseif nargin==2
    alpha = 0;
end

choiceNum=XOVR*19;
choiceNum=round(choiceNum);

%Create the array with non repeat  random num and set choose num
x = randperm(choiceNum);
x = x(1:choiceNum);
FirstChromeChoicedPoint=x;

y = randperm(choiceNum);
y = y(1:choiceNum);
SndChromeChoicedPoint=y;


%change selected bar one by one 
for i = 1 : choiceNum
    
Fpointstart= FirstChromeChoicedPoint(1,i)*length;
Fpointend = Fpointstart+length;

Spointstart= SndChromeChoicedPoint(1,i)*length;
Spointend = Spointstart+length;

temp=OldChrom(Fpointstart:Fpointend,1);
OldChrom(Fpointstart:Fpointend,1)=OldChrom(Spointstart:Spointend,1);
OldChrom(Spointstart:Spointend,1)=temp;

end
%}

%{
x = size(OldChrom,1);   % Number of individuals and chromosome length
npares = floor(x/2);    % Number of pairs
npares
cruzar = rand(npares,1)<= XOVR;    % Pairs to crossover
cruzar
NewChrom=OldChrom;

for i=1:npares
    pin = (i-1)*2+1;
    if ~(cruzar(i)==0)
        betas=rand(2,1)*(1+2*alpha)-(0.5+alpha);
        A=[betas(1) 1-betas(1); 1-betas(2) betas(2)];
        NewChrom(pin:pin+1,:)=A*OldChrom(pin:pin+1,:);
        
    end
end
%}

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