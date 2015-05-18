function gaDat=Gaevolucion(gaDat,plotGraph)

%One times templating created in this funtion
ObjV = inf(gaDat.BlockSize,gaDat.populationSize);


disp('######   FitnessProcess   #########')
%% FITNESSS ---------------------------------------------------------
for i = 1: gaDat.populationSize %(population have size of chromsomes)
    for j = 1:gaDat.blockSize
        if isempty(gaDat.ObjfunPar)
           returnToObjV = Objfunchordfit2(gaDat.Chrom(i,j),gaDat.mainImportInfo);
           ObjV(:,i) =  returnToObjV ;
        else
            %% no needed 
            %ObjV(:,i) = Objfunchordfit2(gaDat.Chrom(i),gaDat.mainImportInfo,gaDat.ObjfunPar);
            %ObjV(:,i) =  returnToObjV ;
        end
        %% display the var variation
        %disp(['(i:j) is '  , num2str(j)])
        %disp(['ObjV(i:j) ' ,num2str(ObjV(i:j))])
    end
end
% ######   Next   #########
%%
%Generation*******************************************************************
% Best individual of the generation ---------------------------------------------------------
%%{   
    gaDat.ObjV=ObjV;
    sumObjV=sum(ObjV,1);
    [v,maxIndex]=max(sumObjV); %[v,p] is [ value , position ]
    [x,minIndex]=min(sumObjV);
    
    if v>=gaDat.fxmax        % the new maximun replace previous one
        gaDat.xmax=gaDat.Chrom(maxIndex).chromNotes;
        gaDat.fxmax=v;
    end
    
    if x<=gaDat.fxmin        % the new minimun replace previous one
        gaDat.xmin=gaDat.Chrom(minIndex).chromNotes;
        gaDat.fxmin=x;
    end
%}
%% SumFitnessinChromesomeBeforeRanking---------------------------------
%%{
     for i = 1 : gaDat.populationsize  
         objVToSort(i) = sum(gaDat.ObjV(:,i));
     end
     objVToSort = objVToSort' ;
%} 
%Ranking-----------------------------------------------------------
%%{
     FitnV = Ranking(objVToSort,gaDat.rf);
     %%make a fake FitnV result here
     %FitnV = randi(100,[1,100]);
%}
%% 
%SELECTION for CROSSOVER---------------------------------------------------------
% Stochastic Universal Sampling (SUS).
%%{
   [SelCh,Indices] = Select('rws',gaDat.Chrom,FitnV,1);
%}
% CROSSOVER--------------------------------------------------------------------------------
% Uniform crossover.
%%{
    %{
    % give a fack SELCH result  pick up  from POPULATION pool certainly
    % SelCh = gaDat.Chrom(1:2,:);   
    %}
    SelCh = lxov(SelCh,gaDat.Pc,gaDat.alfa,gaDat.barsize);
%}   
%SELECTION for Mutation---------------------------------------------------------------
%Stochastic Universal Sampling (SUS).
%%{
   [SelCh,Indices] = Select('rws',gaDat.Chrom,FitnV,1);
%}   
%% MUTATION----------------------------------------------------------------------------------
%%{ 
SelCh = Mutbga(SelCh,gaDat.FieldD,[gaDat.Pm 1]); % Codificaci???n Real.
    
% Reinsert the best individual  -----------------------------------------------------
 %minIndex just one but i have two of CHROM result here so.... how should i
 %do
  gaDat.Chrom(Indices,:) = SelCh;
    
% Optional additional task required by user
 GaIteration(gaDat,plotGraph)
%}
    






