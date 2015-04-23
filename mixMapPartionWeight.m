function mixMapChoice = mixMapPartionWeight(mixMapChoice)

sizeOfDialogMix = size(mixMapChoice.dialogMix,2);
totalOfDialogMix = 0;
sizeOfPatternMix = size(mixMapChoice.patternMix,2);
totalOfPatternMix = 0;
sizeOfMeasureMix = size(mixMapChoice.measureMix,2);
totalOfMeasureMix = 0;

for dialogMixIndex = 1 : sizeOfDialogMix %%every count num of totalOfDialogMix is Pattern we have
    totalOfDialogMix = size(mixMapChoice.dialogMix(1,dialogMixIndex).mixMap,2) + totalOfDialogMix;
end
for patternMixIndex = 1 : sizeOfPatternMix %%every count num of totalOfPatternMix is Measure we have
    totalOfPatternMix = size(mixMapChoice.patternMix(1,patternMixIndex).mixMap,2) + totalOfPatternMix;
end
for measureMixIndex = 1 : sizeOfMeasureMix %%every count num of totalOfMeasureMix is Beat we have
    totalOfMeasureMix = size(mixMapChoice.measureMix(1,measureMixIndex).mixMap,2) + totalOfMeasureMix;
end

for totalOfDialogMixIndex = 1 : totalOfDialogMix
    totalOfDialogMixIndex = totalOfDialogMixIndex - 1;
    totalOfDialogMixIndexFix = fix(totalOfDialogMixIndex/4);
    totalOfDialogMixIndexMod = mod(totalOfDialogMixIndex,4);
    weightIndex = mixMapChoice.dialogMix(1,totalOfDialogMixIndexFix+1).mixMap(1,totalOfDialogMixIndexMod+1);
    if weightIndex == 0
        %for patternFromDialogIndex = totalOfDialogMixIndex : totalOfDialogMixIndex+3
            sizePMix = size(mixMapChoice.patternMix(1,totalOfDialogMixIndex+1).mixMap,2);
            becomeDoNothingZeroTag= zeros(1,sizePMix);
            mixMapChoice.patternMix(1,totalOfDialogMixIndex+1).mixMap = becomeDoNothingZeroTag;
       % end
    else
        %% if want to do some thing sign edit for tag  to do here 
    end
end

for totalOfPatternMixIndex = 1 : totalOfPatternMix
    totalOfPatternMixIndex = totalOfPatternMixIndex - 1;
    totalOfPatternMixIndexFix = fix(totalOfPatternMixIndex/4);
    totalOfPatternMixIndexMod = mod(totalOfPatternMixIndex,4);
    weightIndex = mixMapChoice.patternMix(1,totalOfPatternMixIndexFix+1).mixMap(1,totalOfPatternMixIndexMod+1);
    if weightIndex == 0
        %for measureFromPatternIndex = totalOfPatternMixIndex : totalOfPatternMixIndex+3
            sizeMMix = size(mixMapChoice.measureMix(1,totalOfPatternMixIndex+1).mixMap,2);
            becomeDoNothingZeroTag= zeros(1,sizeMMix);
            mixMapChoice.measureMix(1,totalOfPatternMixIndex+1).mixMap = becomeDoNothingZeroTag;
        %end
    else
          %% if want to do some thing sign edit for tag  to do here 
    end
end






%mixMapChoice.dialogMix.mixMap
%mixMapChoice.patternMix.mixMap
%mixMapChoice.measureMix.mixMap

