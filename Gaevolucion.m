function gaDat=Gaevolucion(gaDat,plotGraph)

% One times templating created in this funtion
%-----------------------------------------
%nind=size(Chrom,1);
nind = gaDat.barNum;
ObjV = inf(gaDat.barNum,gaDat.populationSize);
%-----------------------------------------


for i = 1: gaDat.populationSize %(population have size of chromsomes)
        if isempty(gaDat.ObjfunPar)
            %ObjV(i)=feval(gaDat.Objfun,Chrom(i,:),gaDat.mainMelodyIngaDat(i,:));
           returnToObjV = Objfunchordfit(gaDat.Chrom(i),gaDat.mainImportInfo);
           ObjV(:,i) =  returnToObjV ;
            %A=1; B = 1;
            %objfun_chordfit(A,B);  
        else
            %ObjV(i)=feval(gaDat.Objfun,Chrom(i,:),gaDat.ObjfunPar,gaDat.mainMelodyIngaDat(i,:));
            ObjV(:,i) = Objfunchordfit(gaDat.Chrom(i),gaDat.mainImportInfo,gaDat.ObjfunPar);
            ObjV(:,i) =  returnToObjV ;
        end
        %disp(['(i:j) is '  , num2str(j)])
        %disp(['ObjV(i:j) ' ,num2str(ObjV(i:j))])
end
    
    gaDat.ObjV=ObjV;
    sumObjV=sum(ObjV,1);

    % Best individual of the generation -------------------------
    [v,p]=max(sumObjV); %[v,p] is [ value , position ]
    [x,q]=min(sumObjV);
    
    if v>=gaDat.fxmax        % the new maximun replace previous one
        gaDat.xmax=gaDat.Chrom(p).chromNotes;
        gaDat.fxmax=v;
    end
    
    if x<=gaDat.fxmin        % the new minimun replace previous one
        gaDat.xmin=gaDat.Chrom(q).chromNotes;
        gaDat.fxmin=x;
    end
 
     % Next
     % generation*******************************************************************
     %SumFitnessinChromesomeBeforeRanking---------------------------------
     for i = 1 : gaDat.populationsize  
         objVToSort(i) = sum(gaDat.ObjV(:,i));
     end
     objVToSort = objVToSort' ;
     
     %Ranking-----------------------------------------------------------
     FitnV = Ranking(objVToSort,gaDat.rf);
    
    % SELECTION ---------------------------------------------------------
    % Stochastic Universal Sampling (SUS).
    [SelCh,Indices] = Select('rws',gaDat.Chrom,FitnV,1);
    
    % CROSSOVER ---------------------------------------------------
    % Uniform crossover.
    SelCh = lxov(SelCh,gaDat.Pc,gaDat.alfa,gaDat.barsize);
    
    % MUTATION ------------------------------------------------
    SelCh = Mutbga(SelCh,gaDat.FieldD,[gaDat.Pm 1]); % Codificaci???n Real.
    
    % Reinsert the best individual  ----------------------------------
    Chrom(:,Indices) = SelCh;
    gaDat.Chrom=Chrom;
    
    % Optional additional task required by user
    GaIteration(gaDat,plotGraph)
    
    %% ---------------------------------------------------------
function FitV=Ranking(ObjV,RFun)
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
function [SelCh,Indices]=Select(SEL_F, Chrom, FitnV, GGAP)
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
        indices=Rws2(FitnV,round(length(FitnV)*GGAP));
    elseif (SEL_F=='sus')
        indices=Sus2(FitnV,round(length(FitnV)*GGAP));
       
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
        SelCh=Chrom(indices).chromNotes;
        Indices=indices;
    end
else
    error('Incorrect number of paramenters');
end

function NewChrIx=Sus2(FitnV, Nsel)
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
function NewChrlx=Rws2(FitnV,Nsel)


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
    find = Binarysearch(sumfit,search,Nsel);
    selFinVfind(j)=find;
end

NewChrlx = selFinVfind;

function find=Binarysearch(sumfit,search,Nsel)

low =1;
high = Nsel -1;

while(low<=high)
    mid = (low + high) / 2;
    mid = int16(mid);
    
    %------TESTING---------
    %{
    a = 'inThelowHigh---';
    a
    mid
    testsumfit=sumfit(mid);
    testsumfit
    search
    %}
    %----------------------
    
    if (sumfit(mid)>search)
            if (mid == low)
              find = mid ; 
            break
        else    
            midlow= mid-1;
            if (sumfit(midlow)<search)
                find = mid ; 
                
            break
            end
        end
        high = mid -1;
    elseif (sumfit(mid)<search)
        if(mid == high)
            find = high;
            break
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


