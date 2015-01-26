function gaDat = AddtoChomesome(gaDat,sampleNumChoice,sampleFrameChoice,pMeasure,pBeat,samplePropertiesChoice,pPopulationSize)
%{
gaDat,
sampleFrameChoice,
pMeasure,
pBeat
samplePropertiesChoice
%}

%sampleFrameChoice have message  after beat 

if samplePropertiesChoice == 0
 %%import sample beat choice 
 gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat(1,pBeat) =  sampleFrameChoice;
 %sampleFrameChoice.timeSignatureNumerator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureNumerator;
 %sampleFrameChoice.timeSignatureDenominator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureDenominator;
else
 %%default sample beat choice
 gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat(1,pBeat) =  sampleFrameChoice;
 %sampleFrameChoice.timeSignatureNumerator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureNumerator;
 %sampleFrameChoice.timeSignatureDenominator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureDenominator;
end
