function sampleFrameChoice = SFCmix(gaDat,numMainMeasure,numMainMeasureBeat)
%% Create MixMap
mixMap = MixMapCreate();

randPattern = randMixMap(0);
randMeasure = randMixMap(1);
randBeat = randMixMap(2);

mixMapChoice = mixMapRandChoiced(numMainMeasure,numMainMeasureBeat,randMeasure,randBeat,randPattern,mixMap);

sampleFrameChoice = SFCcreate(mixMapChoice,gaDat);
