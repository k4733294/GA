function sampleFrameChoice = SFCmix(gaDat,mainMeasureNumProperty)
%% Create MixMap
mixMap = MixMapCreate();

mixMapChoice = mixMapRandChoiced(mainMeasureNumProperty,mixMap);

mixMapChoice = mixMapPartionWeight(mixMapChoice);

sampleFrameChoice = SFCcreate(mixMapChoice,gaDat);

