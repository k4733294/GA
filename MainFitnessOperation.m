function gaDat = MainFitnessOperation(gaDat)

totalNumMainMeasure = gaDat.mainImportInfo.mainMeasureNumProperty.totalNumMainMeasure;
chorusPoint = gaDat.mainImportInfo.chorusPoint;
chorusStart = chorusPoint(1,1);
chorusEnd = chorusPoint(1,2);
%% create empty mainMeasureStatus
emptyMatrix = [];
for  pMeasure = 1 : totalNumMainMeasure
    gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus = emptyMatrix;
end
clearvars pMeasure pBeat pFix sizeOfMainNote
%% give mainMeasureStatus with velocity and pitch info filter velocity value lower then 10 in every measure  
for pMeasure = 1 : totalNumMainMeasure
    mainMeasureStatusTrace = [];
    sizeOfMainNote = size(gaDat.mainImportInfo.measure(1,pMeasure).noteContent,1);
    pFix = 0;
    for pMainNote = 1 : sizeOfMainNote
        if  gaDat.mainImportInfo.measure(1,pMeasure).noteContent(pMainNote,6) >=10
            mainMeasureStatusTrace(pMainNote-pFix,1) = gaDat.mainImportInfo.measure(1,pMeasure).noteContent(pMainNote,6);
            mainMeasureStatusTrace(pMainNote-pFix,2) = gaDat.mainImportInfo.measure(1,pMeasure).noteContent(pMainNote,5);
        else
            pFix = pFix + 1;
        end
    end
    gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus = mainMeasureStatusTrace;
end
clearvars pMeasure pBeat pFix sizeOfMainNote
%% got main Verse Velocity and pitch avg
verseSizeOfMainNote = 0;
mainVerseVelocityTotal = 0;
mainVersePitchTotal =0;
 for pMeasure = 1 : chorusStart - 1
    sizeOfMainNote = size(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus,1);
    verseSizeOfMainNote = verseSizeOfMainNote + sizeOfMainNote;
    mainVerseVelocityTotal = sum(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,1)) + mainVerseVelocityTotal;
    mainVersePitchTotal = sum(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,2)) + mainVersePitchTotal;
 end
 clearvars pMeasure pBeat pFix sizeOfMainNote
 if chorusEnd < totalNumMainMeasure
     for pMeasure = chorusEnd+1 : totalNumMainMeasure
         sizeOfMainNote = size(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus,1);
         verseSizeOfMainNote = verseSizeOfMainNote + sizeOfMainNote;
         mainVerseVelocityTotal = sum(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,1)) +mainVerseVelocityTotal;
         mainVersePitchTotal = sum(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,2)) + mainVersePitchTotal;
     end
 end
 mainVerseVelocityAvg= mainVerseVelocityTotal / verseSizeOfMainNote;
 mainVerseVelocityAvg = round(mainVerseVelocityAvg);
 mainVersePitchAvg= mainVersePitchTotal / verseSizeOfMainNote;
 mainVersePitchAvg = round(mainVersePitchAvg);
 %% got main chrous Velocity and pitch avg
 chorusSizeOfMainNote = 0;
 mainChorusVelocityTotal = 0;
 mainChorusPitchTotal =0;
 clearvars pMeasure pBeat pFix sizeOfMainNote
 for pMeasure = chorusStart : chorusEnd
    sizeOfMainNote = size(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus,1);
    chorusSizeOfMainNote = chorusSizeOfMainNote + sizeOfMainNote;
    mainChorusVelocityTotal = sum(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,1)) + mainChorusVelocityTotal;
    mainChorusPitchTotal = sum(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,2)) + mainChorusPitchTotal;
 end
 mainChorusVelocityAvg = mainChorusVelocityTotal / chorusSizeOfMainNote;
 mainChorusVelocityAvg = round(mainChorusVelocityAvg);
 mainChorusPitchAvg = mainChorusPitchTotal / chorusSizeOfMainNote;
 mainChorusPitchAvg = round(mainChorusPitchAvg);
 %% got difference from chrous and verse on Velolcity 
 mainVelocityWeight = mainChorusVelocityAvg - mainVerseVelocityAvg;
 if  mainVelocityWeight > 0
     mainVelocityWeight = fix(mainVelocityWeight/2);
     mainVelocityWeight = round(mainVelocityWeight);
 elseif mainVelocityWeight == 0
 else
     %% give a velocity fix 6 have a level diff
     mainVelocityWeight = abs(mainVelocityWeight);
     mainVelocityWeight = fix(mainVelocityWeight/3);
     mainVelocityWeight = round(mainVelocityWeight);
     mainVelocityWeight = -mainVelocityWeight;
 end
 %% got difference from chrous and verse on Pitch
 mainPitchWeight = mainChorusPitchAvg - mainVersePitchAvg;
 if  mainPitchWeight > 0
     mainPitchWeight = fix(mainPitchWeight/2);
     mainVelocityWeight = round(mainVelocityWeight);
 elseif mainPitchWeight ==0
 else
     %% give a pitch fix 5 have a level diff
     mainPitchWeight = abs(mainPitchWeight);
     mainPitchWeight = fix(mainPitchWeight/5);
     mainPitchWeight = round(mainPitchWeight);
     mainPitchWeight = -mainPitchWeight;
 end
  gaDat.mainImportInfo.mainPitchWeight = mainPitchWeight;
  gaDat.mainImportInfo.mainVelocityWeight = mainVelocityWeight;