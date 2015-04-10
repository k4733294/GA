function gaDat = AddtoChromesome(gaDat,pPopulationSize,pMeasure,sampleFrameChoice)

%% Measure layer and below info we changed to which we create here
gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).noteContent =  sampleFrameChoice.measure(1,1).noteContent;
%% Beat layer and below info we changed to which we create here
gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat = sampleFrameChoice.measure(1,1).beat;
gaDat.sampleFrameChoice(1,pPopulationSize).measure(1,pMeasure).noteContent = sampleFrameChoice.measure(1,1).noteContent;

 
 
         
        



