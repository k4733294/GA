function mixMapChoice = mixMapRandChoiced(mainMeasureNumProperty,mixMap)

numMainMeasure = mainMeasureNumProperty.totalNumMainMeasure;
numMainMeasureBeat = mainMeasureNumProperty.totalNumMainMeasureBeat;

randDialog = randMixMap(0);
randPattern = randMixMap(1);
randMeasure = randMixMap(2);

dialogMixChoiced = mixMap.patternMixMap(randDialog,:);
patternMixChoiced = mixMap.patternMixMap(randPattern,:);
measureMixChoiced = mixMap.measureMixMap(randMeasure,:);

%% Create mixMapChoice DialogMix Struct
% fix the pattern may not full content in dialog like 1 pattern in dialog
dialogFix= fix(numMainMeasure/16);
PatternDoesNotFullOfDialog = mod(numMainMeasure,16);
howManyPatternInThisDialog = fix(numMainMeasure/4);
dialogTemplate = dialogMixChoiced;

partOfMixMapChoice = CreateMixMapChoice(dialogFix,howManyPatternInThisDialog,PatternDoesNotFullOfDialog,dialogTemplate);
mixMapChoice.dialogMix = partOfMixMapChoice;
%% Create mixMapChoice patternMix Struct
% fix the measure may not full content in pattern like 1 measure in pattern
patternFix = fix(numMainMeasure/4);
measureDoesNotFullOfPattern = mod(numMainMeasure,4);
patternTemplate = patternMixChoiced;

partOfMixMapChoice = CreateMixMapChoice(patternFix,measureDoesNotFullOfPattern,measureDoesNotFullOfPattern,patternTemplate);
mixMapChoice.patternMix = partOfMixMapChoice;
%% Create mixMapChoice beatMix Struct
% fix the beat may not full content in measure like 1 beat in measure
measureFix = fix(numMainMeasureBeat/4);
beatDoesNotFullOfMeasure = mod(numMainMeasureBeat,4);
measureTemplate = measureMixChoiced;

partOfMixMapChoice = CreateMixMapChoice(measureFix,beatDoesNotFullOfMeasure,beatDoesNotFullOfMeasure,measureTemplate);
mixMapChoice.measureMix = partOfMixMapChoice;



