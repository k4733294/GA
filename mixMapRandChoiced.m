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

partOfMixMapChoice = mixMapChoice.dialogMix;
partOfMixMapChoice = CreateMixMapChoice(partOfMixMapChoice,dialogFix,howManyPatternInThisDialog,PatternDoesNotFullOfDialog,dialogTemplate);
mixMapChoice.dialogMix = partOfMixMapChoice;

if dialogFix == 1
    if PatternDoesNotFullOfDialog == 0
        mixMapChoice.dialogMix(1,1).mixMap = dialogTemplate;
    else
        mixMapChoice.dialogMix(1,1).mixMap(1,howManyPatternInThisDialog) = dialogTemplate(1,howManyPatternInThisDialog);
    end
else
    mixMapChoice.dialogMix(1,1:dialogFix-1).mixMap = dialogTemplate;
end
if dialogFix ~= 1
    if PatternDoesNotFullOfDialog == 0
        mixMapChoice.dialogMix(1,dialogFix).mixMap = dialogTemplate;
    else
        mixMapChoice.dialogMix(1,dialogFix).mixMap(1,howManyPatternInThisDialog) = dialogTemplate(1,howManyPatternInThisDialog);
    end
end
%% Create mixMapChoice patternMix Struct
% fix the measure may not full content in pattern like 1 measure in pattern
patternFix = fix(numMainMeasure,4);
measureDoesNotFullOfPattern = mod(numMainMeasure,4);
patternTemplate = patternMixChoiced;
if patternFix == 1
    if measureDoesNotFullOfPattern == 0
        mixMapChoice.patternMix(1,1).mixMap = patternTemplate;
    else
        mixMapChoice.patternMix(1,1).mixMap(1,measureDoesNotFullOfPattern) = patternTemplate(1,measureDoesNotFullOfPattern);
    end
else
    mixMapChoice.patternMix(1,1:patternFix-1).mixMap = patternTemplate;
end
if patternFix ~= 1
    if measureDoesNotFullOfPattern == 0
        mixMapChoice.patternMix(1,patternFix).mixMap = patternTemplate;
    else
        mixMapChoice.patternMix(1,patternFix).mixMap(1,measureDoesNotFullOfPattern) = patternTemplate(1,measureDoesNotFullOfPattern);
    end
end
%% Create mixMapChoice beatMix Struct
% fix the beat may not full content in measure like 1 beat in measure
measureFix = fix(numMainMeasureBeat,4);
beatDoesNotFullOfMeasure = mod(numMainMeasureBeat,4);
measureTemplate = measureMixChoiced;
if measureFix == 1
    if beatDoesNotFullOfMeasure == 0
        mixMapChoice.measureMix(1,1).mixMap = measureTemplate;
    else
        mixMapChoice.measureMix(1,1).mixMap(1,beatDoesNotFullOfMeasure) = measureTemplate(1,beatDoesNotFullOfMeasure);
    end
else
    mixMapChoice.measureMix(1,1:measureFix-1).mixMap = measureTemplate;
end
if measureFix ~= 1
    if beatDoesNotFullOfMeasure == 0
        mixMapChoice.measureMix(1,measureFix).mixMap = measureTemplate;
    else
        mixMapChoice.measureMix(1,measureFix).mixMap(1,beatDoesNotFullOfMeasure) = measureTemplate(1,beatDoesNotFullOfMeasure);
    end
end



