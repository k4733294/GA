function sampleFrameChoice = SFCmix(gaDat,numMainMeasure,numMainMeasureBeat)
%% Create MixMap
mixMap = MixMapCreate();

mixMapChoice = mixMapRandChoiced(numMainMeasure,numMainMeasureBeat,mixMap);

sampleFrameChoice = SFCcreate(mixMapChoice,gaDat);
