function mixMapChoice = mixMapRandChoiced(mainMeasureNumProperty,mixMap)

numMainMeasure = mainMeasureNumProperty.totalNumMainMeasure;
numMainMeasureBeat = mainMeasureNumProperty.totalNumMainMeasureBeat;

randDialog = randMixMap(0);
randPattern = randMixMap(1);
randMeasure = randMixMap(2);

dialogMixChoiced = mixMap.dialogMixMap(randDialog,:);
patternMixChoiced = mixMap.patternMixMap(randPattern,:);
measureMixChoiced = mixMap.measureMixMap(randMeasure,:);

%% Create mixMapChoice DialogMix Struct
% fix the pattern may not full content in dialog like 1 pattern in dialog
dialogFix= fix(numMainMeasure/16);
PatternDoesNotFullOfDialog = mod(numMainMeasure,16);
if PatternDoesNotFullOfDialog ~= 0
    dialogFix = dialogFix+1;
end
howManyPatternInThisDialog = fix(PatternDoesNotFullOfDialog/4);
dialogTemplate = dialogMixChoiced;

partOfMixMapChoice = CreateMixMapChoice(dialogFix,howManyPatternInThisDialog,0,dialogTemplate);
mixMapChoice.dialogMix = partOfMixMapChoice;
%% Create mixMapChoice patternMix Struct
% fix the measure may not full content in pattern like 1 measure in pattern
patternFix = fix(numMainMeasure/4);
measureDoesNotFullOfPattern = mod(numMainMeasure,4);
if measureDoesNotFullOfPattern ~= 0
    patternFix = patternFix+1;
end
patternTemplate = patternMixChoiced;

partOfMixMapChoice = CreateMixMapChoice(patternFix,measureDoesNotFullOfPattern,measureDoesNotFullOfPattern,patternTemplate);
mixMapChoice.patternMix = partOfMixMapChoice;
%% Create mixMapChoice beatMix Struct
% fix the beat may not full content in measure like 1 beat in measure
%measureFix = fix(numMainMeasureBeat/4);
measureFix = 44;
beatDoesNotFullOfMeasure = mod(numMainMeasureBeat,4);
if measureDoesNotFullOfPattern ~= 0
    beatDoesNotFullOfMeasure = beatDoesNotFullOfMeasure+1;
end
measureTemplate = measureMixChoiced;

partOfMixMapChoice = CreateMixMapChoice(measureFix,beatDoesNotFullOfMeasure,beatDoesNotFullOfMeasure,measureTemplate);
mixMapChoice.measureMix = partOfMixMapChoice;



