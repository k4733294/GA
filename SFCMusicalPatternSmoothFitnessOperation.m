function gaDat = SFCMusicalPatternSmoothFitnessOperation(gaDat,populationSize)
chrom = gaDat.chromsome;
pPopu = populationSize;
patternLength = gaDat.patternLength;
totalNumMainMeasure = gaDat.mainImportInfo.mainMeasureNumProperty.totalNumMainMeasure;
patternNameSmoothScore = 0;

patternNums = fix(totalNumMainMeasure/patternLength);
patternNums = round(patternNums);
patternNameSmooth(patternNums,patternLength) = -1;
patternVarianceSmooth(patternNums,patternLength) = -1;

for pMeasure = 1 : totalNumMainMeasure
    patternIdex = fix(pMeasure/patternLength);
    pMeasureIndex = mod(pMeasure,patternLength);
    if pMeasureIndex == 0
        pMeasureIndex = 4;
        patternIdex = patternIdex - 1;
    end
    patternNameSmooth(patternIdex+1,pMeasureIndex) = chrom(1,pPopu).measure(1,pMeasure).rhythm;
    patternVarianceSmooth(patternIdex+1,pMeasureIndex) = chrom(1,pPopu).measure(1,pMeasure).patternVariance;
end

sizeOfPatternNS = size(patternNameSmooth);
measureSmoothScore = 0;
MeasureSmoothScoreMap = [1 2 3 4 ; -1 2 -1 2];
for patternIndex = 1 : sizeOfPatternNS(1,1)
    measureSmooth = patternNameSmooth(patternIndex,:);
    diffMeasureRhythm = unique(measureSmooth);
    howManyDiffMeasure = size(diffMeasureRhythm,2);
    for pDiffMeasure = 1 : howManyDiffMeasure
        measureRepeat = find(patternNameSmooth(patternIndex,:) == diffMeasureRhythm(1,pDiffMeasure));
        numsMeasureRepeat = size(measureRepeat,2);
        measureSmoothScoreMapIndex = find(MeasureSmoothScoreMap(1,:) == numsMeasureRepeat,1,'first');
        measureSmoothScore = MeasureSmoothScoreMap(2,measureSmoothScoreMapIndex) + measureSmoothScore;
    end
end

clearvars  patternIndex
for patternIndex = 1 : sizeOfPatternNS(1,1) - 1
    patternNameSmoothCheck = patternNameSmooth(patternIndex,:) == patternNameSmooth(patternIndex+1,:);
    patternNameSmoothDetermine = all(patternNameSmoothCheck);
    patternVarianceSmoothCheck = patternVarianceSmooth(patternIndex,:) == patternVarianceSmooth(patternIndex+1,:);
    patternVarianceSmoothDetermine = all(patternVarianceSmoothCheck);
    patternNameSmoothScoreAdd = 0;
    if patternNameSmoothDetermine == 1
        if patternVarianceSmoothDetermine == 0
            patternNameSmoothScoreAdd = 5;
        elseif patternVarianceSmoothDetermine == 1
            patternNameSmoothScoreAdd = 5*1.2;
        end
    else
        if patternVarianceSmoothDetermine == 1
            patternNameSmoothScoreAdd = -1;
        elseif patternVarianceSmoothDetermine == 0
            patternNameSmoothScoreAdd = -1*1.2;
        end
    end
    if mod(patternIndex,4) == 0
        patternNameSmoothScore = patternNameSmoothScore - patternNameSmoothScoreAdd;
    else
        patternNameSmoothScore = patternNameSmoothScore + patternNameSmoothScoreAdd;
    end
end
patternNameSmoothScore = round(patternNameSmoothScore);
gaDat.Chrom(1,pPopu).patternNameSmoothScore = patternNameSmoothScore;
gaDat.Chrom(1,pPopu).MeasureSmoothScore = measureSmoothScore;

