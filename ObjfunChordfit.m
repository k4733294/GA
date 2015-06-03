function FitnV = ObjfunChordFit(populationSize,gaDat)
FitnV = zeros(populationSize,1);

gaDat = MainFitnessOperation(gaDat);
 for pPopu = 1 : populationSize
     gaDat = SFCFitnessOperation(gaDat,populationSize);
 end
 %% 
 mainPitchWeight = gaDat.mainImportInfo.mainPitchWeight;
 mainVelocityWeight = gaDat.mainImportInfo.mainVelocityWeight;
 for pPopu = 1 : populationSize
     sfcDensityWeight = gaDat.Chrom(1,pPopu).sfcDensityWeight;
     sfcBassLevelWeight = gaDat.Chrom(1,pPopu).sfcBassLevelWeight;
     %%
     if sfcDensityWeight > 0
         PitchDensityWeight = mainPitchWeight*sfcDensityWeight;
         VelocityDensityWeight = mainVelocityWeight*sfcDensityWeight;
     else
         PitchDensityWeight = 0;
         VelocityDensityWeight = 0;
     end
     
     if sfcBassLevelWeight > 0
         PitchBassLevelWeight = mainPitchWeight*sfcBassLevelWeight;
         VelocityBassLevelWeight = mainVelocityWeight*sfcBassLevelWeight;
     else
         PitchBassLevelWeight = 0;
         VelocityBassLevelWeight = 0;
     end
     %%
     chromFitness= (PitchDensityWeight + VelocityDensityWeight +PitchBassLevelWeight +VelocityBassLevelWeight)/4;
     FitnV(pPopu,chromFitness) = chromFitness;
 end
 
 
 %{
 %% One times templating created in this funtion
ObjV = inf(gaDat.BlockSize,gaDat.populationSize);
ObjV(:,i) =  returnToObjV ;
 % ######   Next   #########
%%
%Generation*******************************************************************
% Best individual of the generation ---------------------------------------------------------
%%{   
    gaDat.ObjV = ObjV;
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
%? SumFitnessinChromesomeBeforeRanking---------------------------------
%{
     for i = 1 : gaDat.populationsize  
         objVToSort(i) = sum(gaDat.ObjV(:,i));
     end
     objVToSort = objVToSort' ;
%} 
%Ranking-----------------------------------------------------------
%{
     FitnV=Ranking(objVToSort,gaDat.rf);
     %% make a fake FitnV result here
     FitnV = randi(100,[1,100]);
%}
%}