function sampleFrameChoice = SBC(gaDat,sampleNumChoice,samplePropertiesChoice)
if samplePropertiesChoice == 0
     %%import sample beat choice 
     sampleFrameChoice.measure = gaDat.chordImportInfo(1,sampleNumChoice).measure(1,:);
     sampleFrameChoice.tonal = gaDat.chordImportInfo(1,sampleNumChoice).tonal;
     sampleFrameChoice.chordLength = gaDat.chordImportInfo(1,sampleNumChoice).chordLength;
     %sampleFrameChoice.timeSignatureNumerator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureNumerator;
     %sampleFrameChoice.timeSignatureDenominator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureDenominator;
else
     %%default sample beat choice
     sampleFrameChoice.measure = gaDat.defaultImportInfo(1,sampleNumChoice).measure(1,:);
     sampleFrameChoice.tonal = gaDat.defaultImportInfo(1,sampleNumChoice).tonal;
     sampleFrameChoice.chordLength = gaDat.defaultImportInfo(1,sampleNumChoice).chordLength;
     %sampleFrameChoice.timeSignatureNumerator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureNumerator;
     %sampleFrameChoice.timeSignatureDenominator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureDenominator;
end

