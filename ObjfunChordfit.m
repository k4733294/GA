function gaDat = ObjfunChordFit(populationSize,gaDat)
fitnV = zeros(populationSize,1);
gaDat = MainFitnessOperation(gaDat);
 for pPopu = 1 : populationSize
     gaDat = SFCFitnessOperation(gaDat,pPopu);
 end
 %%
 clearvars pPopu
 mainPitchWeight = gaDat.mainImportInfo.mainPitchWeight;
 mainVelocityWeight = gaDat.mainImportInfo.mainVelocityWeight;
 for pPopu = 1 : populationSize
     sfcDensityWeight = gaDat.chromsome(1,pPopu).sfcDensityWeight;
     sfcBassLevelWeight = gaDat.chromsome(1,pPopu).sfcBassLevelWeight;
     %SFCMusicalPatternSmoothFitnessOperationUse = 0;
     %%
     if mainPitchWeight > 0
         PitchDensityWeight = mainPitchWeight*sfcDensityWeight;
         PitchBassLevelWeight = mainPitchWeight*sfcBassLevelWeight;
     elseif mainPitchWeight == 0
         %SFCMusicalPatternSmoothFitnessOperationUse = SFCMusicalPatternSmoothFitnessOperationUse+1;
         PitchDensityWeight = 0;
         PitchBassLevelWeight = 0;
     else
         PitchDensityWeight = -(mainPitchWeight*sfcDensityWeight);
         PitchBassLevelWeight = -(mainPitchWeight*sfcBassLevelWeight);
     end
     
     if mainVelocityWeight > 0
         VelocityDensityWeight = mainVelocityWeight*sfcDensityWeight;
         VelocityBassLevelWeight = mainVelocityWeight*sfcBassLevelWeight;
     elseif mainPitchWeight == 0
         %SFCMusicalPatternSmoothFitnessOperationUse = SFCMusicalPatternSmoothFitnessOperationUse+1;
         VelocityDensityWeight = 0;
         VelocityBassLevelWeight = 0;
     else
         VelocityDensityWeight = -(mainVelocityWeight*sfcDensityWeight);
         VelocityBassLevelWeight = -(mainVelocityWeight*sfcBassLevelWeight);
     end
     
     gaDat = SFCMusicalPatternSmoothFitnessOperation(gaDat,pPopu);
     %%
     patternNameSmoothScore = gaDat.chromsome(1,pPopu).patternNameSmoothScore;
     measureSmoothScore = gaDat.chromsome(1,pPopu).measureSmoothScore;
     if mainPitchWeight ~= 0
         chromFitnessPVDBL = (PitchDensityWeight + PitchBassLevelWeight +VelocityDensityWeight +VelocityBassLevelWeight)/4 ;
         chromFitnessPVDBL = round(chromFitnessPVDBL);
         chromFitnessS = (patternNameSmoothScore + measureSmoothScore)/2;
         chromFitness = chromFitnessPVDBL + chromFitnessS;
         chromFitness = round(chromFitness);
     else
         chromFitnessS = (patternNameSmoothScore*patternNameSmoothScore + measureSmoothScore*measureSmoothScore)/2;
         round(chromFitnessS);
         chromFitness = chromFitnessS;
     end
     %%{
     if gaDat.gen >1
         if pPopu == gaDat.indicesXov(1,1)
             disp('FitnessOutput1');
             %sfcDensityWeightVar = gaDat.sfcDensityWeightVar;
             %sfcDensityWeightVar
             mainPitchWeight
             mainVelocityWeight
             gaDat.patternNameSmoothScore1 = patternNameSmoothScore;
             gaDat.measureSmoothScore1 = measureSmoothScore;
         end
         if pPopu == gaDat.indicesXov(1,2)
              disp('FitnessOutput2');
              gaDat.patternNameSmoothScore2 = patternNameSmoothScore;
             gaDat.measureSmoothScore2 = measureSmoothScore;
         end
     end
     %}
     %{
     %%if any fitness score less then 10 ,give a normal score 10 for sel
     %%choice 
     if chromFitness <= 10
         chromFitness = 10;
     end
     %}
     fitnV(pPopu,1) = chromFitness;
 end
 gaDat.fitnV = fitnV;
 gaDat.fitnVTotal = sum(fitnV(:,1));
 gaDat.fitnVGen(:,gaDat.gen) = fitnV(:,1);
 
 [maxScore,maxIndex] = max(fitnV(:,1)); %[v,p] is [ value , position ]
 [minScore,minIndex] = min(fitnV(:,1));

% if maxScore >= gaDat.fxmax        % the new maximun replace previous one
     gaDat.xmax = maxIndex;
     gaDat.fxmax = maxScore;
 %end
 %if minScore <= gaDat.fxmin        % the new minimun replace previous one
     gaDat.xmin = minIndex;
     gaDat.fxmin = minScore;
 %end

 %{
 %% One times templating created in this funtion
ObjV = inf(gaDat.BlockSize,gaDat.populationSize);
ObjV(:,i) =  returnToObjV ;
 %}
 % ######   Next   #########
%%
%Generation*******************************************************************
% Best individual of the generation ---------------------------------------------------------
%{   
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
%{
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