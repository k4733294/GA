function gaDat = AddtoChromesome(gaDat,populationPosition,pMeasure,sampleFrameChoice)

%% Measure layer and below info we changed to which we create here
gaDat.chromsome(1,populationPosition).measure(1,pMeasure).noteContent =  sampleFrameChoice.measure(1,pMeasure).noteContent;
%% Beat layer and below info we changed to which we create here
gaDat.chromsome(1,populationPosition).measure(1,pMeasure).beat = sampleFrameChoice.measure(1,pMeasure).beat;
gaDat.chromsome(1,populationPosition).chordLength = sampleFrameChoice.chordLength;
gaDat.chromsome(1,populationPosition).measure(1,pMeasure).patternVariance = sampleFrameChoice.measure(1,pMeasure).patternVariance;
gaDat.sampleFrameChoice(1,populationPosition).measure(1,pMeasure).noteContent = sampleFrameChoice.measure(1,pMeasure).noteContent;
gaDat.sampleFrameChoice(1,populationPosition).chordLength = sampleFrameChoice.chordLength;
gaDat.sampleFrameChoice.measure(1,pMeasure).patternVariance = sampleFrameChoice.measure(1,pMeasure).patternVariance;


 
 
         
        



