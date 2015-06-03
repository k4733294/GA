function gaDat = SFCFitnessOperation(gaDat,populationSize)
chrom = gaDat.Chrom;
pPopu = populationSize;

totalNumMainMeasure = gaDat.mainImportInfo.mainMeasureNumProperty.totalNumMainMeasure;
numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);

chorusPoint = gaDat.mainImportInfo.chorusPoint;
chorusStart = chorusPoint(1,1);
chorusEnd = chorusPoint(1,2);

chrom(1,pPopu).measure(1,numMainMeasure).sfcMeasureBassLevel = [];
chrom(1,pPopu).measure(1,numMainMeasure).sfcMeasureDensity = [];
%% 
for pMeasure = 1 : totalNumMainMeasure
 sfcMeasureDensityTrace = zeros(sizeOfSFCNote,2);
 sfcMeasureBassLevelTrace = zeros(sizeOfSFCNote,2);
 sizeOfSFCNote = size(chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent,1);
 for pBeat  = 1 : numMainMeasureBeat
     pFix = 0;
     for pSFCNote = 1 : sizeOfSFCNote
         if chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,3) ~= 0
             sfcMeasureDensityTrace(pSFCNote-pFix,1) = chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,3);
         else
             pFix = pFix+1;
         end
     end
     clearvars pSFCNote pFix
     pFix = 0;
     for pSFCNote = 1 : sizeOfSFCNote
              noteTrace = chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,5);
              if noteTrace <= 36 && noteTrace ~=0
                sfcMeasureBassLevelTrace(pSFCNote-pFix,1) = chrom(1,pPopu).measure(1,pMeasure).beat(1,pBeat).noteContent(pSFCNote,5);
             else
                 pFix = pFix+1;
              end
     end
     sfcMDbeAppend = chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensityTrace;
     chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity = [sfcMDbeAppend ; sfcMeasureStatusTrace];
     gaDat.Chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity =  [sfcMDbeAppend ; sfcMeasureStatusTrace];
     sfcMBLbeAppend = chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevelTrace;
     chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel = [sfcMBLbeAppend ; sfcMeasureBassLevel];
     gaDat.Chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel = [sfcMBLbeAppend ; sfcMeasureBassLevel];
 end
end  
clearvars pMeasure pBeat pFix pSFCNote
 %%
densityWeightMap = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16;16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 ];
verseSizeOfSFCNote = 0;
sfcVerseDensityWeightTotal = 0;
for pMeasure = 1 : chorusStart - 1
    sizeOfSFCD = size( chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity);
    verseSizeOfSFCNote = sizeOfSFCD + verseSizeOfSFCNote;
    for pNote  = 1 : sizeOfSFCD %%"cL" for step with sample chord length
        noteTrace= chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity(pNote,1);
        noteWeightMapIndex = find(noteTrace == densityWeightMap(:,1),1,'first');
        sfcVerseDensityWeightTotal = densityWeightMap(noteWeightMapIndex,2)+ sfcVerseDensityWeightTotal;
    end
end
sfcVerseDensityWeightAvg = sfcVerseDensityWeightTotal / verseSizeOfSFCNote;
clearvars pMeasure pBeat pFix sizeOfSFCD sizeOfSFCBL pNote noteTrace noteWeightMapIndex 

chorusSizeOfSFCNote = 0;
sfcChorusDensityWeightTotal = 0;
for pMeasure = chorusStart : chorusEnd
    chorusSizeOfSFCNote = size( chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity) + chorusSizeOfSFCNote;
    for pNote  = 1 : sizeOfSFCD %%"cL" for step with sample chord length
         noteTrace = chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity(pNote,1);
         noteWeightMapIndex = find(noteTrace == densityWeightMap(:,1),1,'first');
         sfcChorusDensityWeightTotal = densityWeightMap(noteWeightMapIndex,2)+ sfcChorusDensityWeightTotal;
    end
end
sfcChorusDensityWeightAvg = sfcChorusDensityWeightTotal / chorusSizeOfSFCNote;
clearvars pMeasure pBeat pFix sizeOfSFCD pNote noteTrace noteWeightMapIndex

%% 
sfcDensityWeight = sfcVerseDensityWeightAvg - sfcChorusDensityWeightAvg;
 %%
verseSizeOfSFCNote = 0;
sfcVerseBassLevelTotal =0;
for pMeasure = 1 : chorusStart - 1
    verseSizeOfSFCNote = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel)+verseSizeOfSFCNote;
    sfcVerseBassLevelTotal = chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel(:,1)+sfcVerseBassLevelTotal;
end
sfcVerseBassLevelAvg = sfcVerseBassLevelTotal/verseSizeOfSFCNote;
clearvars pMeasure pBeat pFix sizeOfSFCD sizeOfSFCBL

chorusSizeOfSFCNote = 0;
sfcChorusBassLevelTotal =0;
for pMeasure = chorusStart : chorusEnd
    chorusSizeOfSFCNote = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel)+chorusSizeOfSFCNote;
    sfcChorusBassLevelTotal = chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel(:,1) + sfcChorusBassLevelTotal;
end
sfcChorusBassLevelAvg = sfcChorusBassLevelTotal/chorusSizeOfSFCNote;
clearvars pMeasure pBeat pFix sizeOfSFCNote
%% 
sfcBassLevelWeight = sfcVerseBassLevelAvg - sfcChorusBassLevelAvg;
 %%
 gaDat.Chrom(1,pPopu).sfcDensityWeight = sfcDensityWeight;
 gaDat.Chrom(1,pPopu).sfcBassLevelWeight = sfcBassLevelWeight;
 
 