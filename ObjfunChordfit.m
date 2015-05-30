function FitnV = ObjfunChordFit(populationSize,chrom,mainMelody,gaDat)
totalNumMainMeasure = gaDat.mainImportInfo.mainMeasureNumProperty.totalNumMainMeasure;
numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
chorusPoint = gaDat.mainImportInfo.chorusPoint;

%%init meausreVelocityMatrix
gaDat.mainImportInfo.measure(1,numMainMeasure).mainMeasureStatus =[] ;
chrom(1,:).measure(1,numMainMeasure).sfcMeasureStatus = [];
%%
for pPopu = 1 : populationSize
    %chordLength = Chrom(1,pPopu).chordLength;
     for pMeasure = 1 : totalNumMainMeasure
         mainMeasureStatusTrace = zeros(sizeOfMainNote,2);
         sfcMeasureStatusTrace = zeros(sizeOfSFCNote,2);

         for pBeat  = 1 : numMainMeasureBeat %%"cL" for step with sample chord length
             sizeOfMainNote = size(mainMelody.measure(1,pMeasure).beat(1,pBeat).noteContent,1);
             pFix = 0;
             for pMainNote = 1 : sizeOfMainNote
                 if  gaDat.mainImportInfo.measure(1,numMainMeasure).beat(1,pBeat).noteContent(pMainNote+pFix,6) >=10
                     mainMeasureStatusTrace(pMainNote+pFix,1) = gaDat.mainImportInfo.measure(1,numMainMeasure).beat(1,pBeat).noteContent(pMainNote+pFix,6);
                     mainMeasureStatusTrace(pMainNote+pFix,2) = gaDat.mainImportInfo.measure(1,numMainMeasure).beat(1,pBeat).noteContent(pMainNote+pFix,5);
                 else
                     pFix = pFix + 1;
                 end
             end
     
             sizeOfSFCNote = size(chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent,1);
             pFix = 0;
             for pSFCNote = 1 : sizeOfSFCNote
                 if chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,6) >= 10
                    sfcMeasureStatusTrace(pSFCNote,1) = chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,6);
                    sfcMeasureStatusTrace(pSFCNote,2) = chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,5);
                 else
                     pFix = pFix+1;
                 end
             end
         end
         mMSbeAppend = gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus;
         gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus = [mMSbeAppend ; mainMeasureStatusTrace];
         sfcMSbeAppend = chrom(1,pPopu).measure(1,pMeasure).sfcMeasureStatus;
         chrom(1,pPopu).measure(1,pMeasure).sfcBeatVelocityStatus = [sfcMSbeAppend ; sfcMeasureStatusTrace];
     end
end
 
 clearvars pMeasure pBeat pFix

 chorusStart = chorusPoint(1,1);
 chorusEnd = chorusPoint(1,2);
 
 for pMeasure = 1 : totalNumMainMeasure
    gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus
 end
 clearvars pMeasure
 
 for pPopu = 1 : populationSize
     for pMeasure = 1 : totalNumMainMeasure
         for pBeat  = 1 : numMainMeasureBeat %%"cL" for step with sample chord length
             chrom(1,pPopu).measure(1,pMeasure).sfcBeatVelocityStatus
         end
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