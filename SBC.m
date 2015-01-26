function sampleFrameChoice = SBC(gaDat,pMeasure,pBeat,sampleNumChoice,samplePropertiesChoice)


if samplePropertiesChoice == 0
 %%import sample beat choice 
 sampleFrameChoice = gaDat.chordImportInfo(1,sampleNumChoice).measure(1,pMeasure).beat(1,pBeat);
 %sampleFrameChoice.timeSignatureNumerator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureNumerator;
 %sampleFrameChoice.timeSignatureDenominator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureDenominator;
else
 %%default sample beat choice
 sampleFrameChoice = gaDat.defaultImportInfo(1,sampleNumChoice).measure(1,pMeasure).beat(1,pBeat);
 %sampleFrameChoice.timeSignatureNumerator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureNumerator;
 %sampleFrameChoice.timeSignatureDenominator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureDenominator;

end

