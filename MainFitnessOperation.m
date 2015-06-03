function gaDat = MainFitnessOperation(gaDat)

totalNumMainMeasure = gaDat.mainImportInfo.mainMeasureNumProperty.totalNumMainMeasure;
numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
chorusPoint = gaDat.mainImportInfo.chorusPoint;
chorusStart = chorusPoint(1,1);
chorusEnd = chorusPoint(1,2);

gaDat.mainImportInfo.measure(1,numMainMeasure).mainMeasureStatus =[] ;
for pMeasure = 1 : totalNumMainMeasure
     mainMeasureStatusTrace = zeros(sizeOfMainNote,2);
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
         mMSbeAppend = gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus;
         gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus = [mMSbeAppend ; mainMeasureStatusTrace];
     end
 end
 
clearvars pMeasure pBeat pFix sizeOfMainNote
%% 
verseSizeOfMainNote = 0;
mainVerseVelocityTotal = 0;
mainVersePitchTotal =0;
 for pMeasure = 1 : chorusStart-1
    sizeOfMainNote = size(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus);
    verseSizeOfMainNote = verseSizeOfMainNote + sizeOfMainNote;
    mainVerseVelocityTotal = gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,1) +mainVerseVelocityTotal;
    mainVersePitchTotal = gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,2) + mainVersePitchTotal;
 end
 mainVerseVelocityAvg= mainVerseVelocityTotal / verseSizeOfMainNote;
 mainVerseVelocityAvg = round(mainVerseVelocityAvg);
 mainVersePitchAvg= mainVersePitchTotal / verseSizeOfMainNote;
 mainVersePitchAvg = round(mainVersePitchAvg);
 
 chorusSizeOfMainNote = 0;
 mainChorusVelocityTotal = 0;
 mainChorusPitchTotal =0;
 clearvars pMeasure pBeat pFix sizeOfMainNote
 for pMeasure = chorusStart : chorusEnd
    sizeOfMainNote = size(gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus);
    chorusSizeOfMainNote = chorusSizeOfMainNote + sizeOfMainNote;
    mainChorusVelocityTotal = gaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,1) + mainChorusVelocityTotal;
    mainChorusPitchTotal = mainChorusNoteTotalgaDat.mainImportInfo.measure(1,pMeasure).mainMeasureStatus(:,2) + mainChorusNoteTotal;
 end
 mainChorusVelocityAvg = mainChorusVelocityTotal / chorusSizeOfMainNote;
 mainChorusVelocityAvg = round(mainChorusVelocityAvg);
 mainChorusPitchAvg = mainChorusPitchTotal / chorusSizeOfMainNote;
 mainChorusPitchAvg = round(mainChorusPitchAvg);
 %%
 mainVelocityWeight = mainChorusVelocityAvg - mainVerseVelocityAvg;
 if  mainVelocityWeight > 0
    mainVelocityWeight = fix(mainVelocityWeight/6);
 elseif mainVelocityWeight == 0
 else
    mainVelocityWeight = abs(mainVelocityWeight);
    mainVelocityWeight = fix(mainVelocityWeight/6);
    mainVelocityWeight = -mainVelocityWeight;
 end
 
 mainPitchWeight = mainChorusPitchAvg - mainVersePitchAvg;
  if  mainPitchWeight > 0
     mainPitchWeight = fix(mainPitchWeight);
  elseif mainPitchWeight ==0
  else
      mainPitchWeight = abs(mainPitchWeight);
      mainPitchWeight = fix(mainPitchWeight/5);
      mainPitchWeight = -mainPitchWeight;   
  end
 
  gaDat.mainImportInfo.mainPitchWeight = mainPitchWeight;
  gaDat.mainImportInfo.mainVelocityWeight = mainVelocityWeight;