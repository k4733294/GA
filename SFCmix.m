function sampleFrameChoice = SFCmix(gaDat,mainMeasureNumProperty)
%% Create MixMap
mixMap = MixMapCreate();

mixMapChoice = mixMapRandChoiced(mainMeasureNumProperty,mixMap);

sampleFrameChoice = SFCcreate(mixMapChoice,gaDat);
