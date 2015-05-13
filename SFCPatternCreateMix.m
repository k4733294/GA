function sampleFrameChoice = SFCPatternCreateMix(gaDat,mainMeasureNumProperty)
%% Create MixMap
mixMap = MixMapCreate();

mixMapChoice = mixMapRandChoiced(mainMeasureNumProperty,mixMap);

mixMapChoice = mixMapPartionWeight(mixMapChoice);

sampleFrameChoice = SFCcreate(mixMapChoice,gaDat);
