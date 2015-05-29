function FitnV = ObjfunChordFit(sampleFrameChoice,mainMelody,gaDat)
totalNumMainMeasure = gaDat.mainImportInfo.mainMeasureNumProperty.totalNumMainMeasure;
numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
chordLength = sampleFrameChoice.chordLength;
chorusPoint = gaDat.mainImportInfo.chorusPoint;

%%init meausreVelocityMatrix
meausreVelocityMatrix(1,1:totalNumMainMeasure).mainBeatVelocityMatrix(1,1:numMainMeasureBeat).noteVelocity = [];
meausreVelocityMatrix(1,1:totalNumMainMeasure).sfcBeatVelocityMatrix(1,1:numMainMeasureBeat).noteVelocity = [];
%%
 for pMeasure = 1 : totalNumMainMeasure
     for pBeat  = 1 : numMainMeasureBeat %%"cL" for step with sample chord length
         sizeOfMainNote = size(mainMelody.measure(1,pMeasure).beat(1,pBeat).noteContent,1);
         mainBeatVelocityMatrix = zeros(sizeOfMainNote,1);
         for pMainNote = 1 : sizeOfMainNote
             mainBeatVelocityMatrix(pMainNote,1) = gaDat.mainImportInfo.measure(1,numMainMeasure).beat(1,pBeat).noteContent(pMainNote,6);
         end
         meausreVelocityMatrix(1,totalNumMainMeasure).mainBeatVelocityMatrix(1,pBeat).noteVelocity = mainBeatVelocityMatrix;
         
         sizeOfSFCNote = size(sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat).noteContent,1);
          sfcBeatVelocityMatrix = zeros(sizeOfSFCNote,1);
         for pSFCNote = 1 : sizeOfSFCNote
            sfcBeatVelocityMatrix(pSFCNote,1) = sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,6);
         end
         meausreVelocityMatrix(1,totalNumMainMeasure).sfcBeatVelocityMatrix(1,pBeat).noteVelocity = sfcBeatVelocityMatrix;   
     end
 end
 
 clearvars pMeasure pBeat

 chorusStart = chorusPoint(1,1);
 chorusEnd = chorusPoint(1,2);
 noteVelocity
 for pMeasure = chorusStart : chorusEnd
     for pBeat  = 1 : numMainMeasureBeat %%"cL" for step with sample chord length
         = meausreVelocityMatrix(1,pMeasure).sfcBeatVelocityMatrix(1,pBeat).noteVelocity;
         
         = meausreVelocityMatrix(1,pMeasure).mainBeatVelocityMatrix(1,pBeat).noteVelocity;
         
     end
 end
 
 
 %One times templating created in this funtion
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