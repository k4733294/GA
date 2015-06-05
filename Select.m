function [SelCh,Indices]=Select(SEL_F, Chrom, FitnV, GGAP)
% Selection Function
if (nargin==3) %  No overlap -------------------
    %{
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
    %}
elseif (nargin==4) % With overlap -----------------------------
	% Indexes of new individuals
    if (SEL_F == 'rws')
        indices=Rws(FitnV,round(length(FitnV)*GGAP));
    elseif (SEL_F == 'sus')
        %indices=Sus2(FitnV,round(length(FitnV)*GGAP));
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
        SelCh=Chrom(1,indices);
        Indices=indices;
    end
else
    error('Incorrect number of paramenters');
end

%% ---------------------------------------------------------
%{
function NewChrIx=Sus2(FitnV, Nsel)

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
%}