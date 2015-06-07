function sampleFrameChoice = SBC(gaDat,sampleNumChoice,samplePropertiesChoice)
if samplePropertiesChoice == 0
     %%import sample beat choice 
     sampleFrameChoice.measure = gaDat.chordImportInfo(1,sampleNumChoice).measure(1,:);
     sampleFrameChoice.tonal = gaDat.chordImportInfo(1,sampleNumChoice).tonal;
     sampleFrameChoice.chordLength = gaDat.chordImportInfo(1,sampleNumChoice).chordLength;
     sampleFrameChoice.midiString = gaDat.chordImportInfo(1,sampleNumChoice).midiString;
     sizeCMImeasure = size(gaDat.chordImportInfo(1,sampleNumChoice).measure,2);
     sizeCMImeasureFix = fix(sizeCMImeasure/4);
     sizeCMImeasureMod = mod(sizeCMImeasure,4);
     if sizeCMImeasureFix <= 0
         sizeOfSFCM = sizeCMImeasureMod;
     else
         sizeOfSFCM = sizeCMImeasureFix*4;
     end
     sampleFrameChoice.sizeOfSFCM = sizeOfSFCM;
     sampleFrameChoice.rhythm = gaDat.chordImportInfo(1,sampleNumChoice).rhythm;
     %sampleFrameChoice.timeSignatureNumerator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureNumerator;
     %sampleFrameChoice.timeSignatureDenominator = gaDat.chordImportInfo(1,sampleNumChoice).timeSignatureDenominator;
else
     %%default sample beat choice
     sampleFrameChoice.measure = gaDat.defaultImportInfo(1,sampleNumChoice).measure(1,:);
     sampleFrameChoice.tonal = gaDat.defaultImportInfo(1,sampleNumChoice).tonal;
     sampleFrameChoice.chordLength = gaDat.defaultImportInfo(1,sampleNumChoice).chordLength;
     sampleFrameChoice.midiString = gaDat.defaultImportInfo(1,sampleNumChoice).midiString;
     sampleFrameChoice.sizeOfSFCM = size(gaDat.defaultImportInfo(1,sampleNumChoice).measure,2);
     sampleFrameChoice.rhythm = gaDat.defaultImportInfo(1,sampleNumChoice).rhythm;
     %sampleFrameChoice.timeSignatureNumerator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureNumerator;
     %sampleFrameChoice.timeSignatureDenominator = gaDat.defaultImportInfo(1,sampleNumChoice).timeSignatureDenominator;
end

