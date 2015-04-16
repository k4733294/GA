function mixMapChoice = mixMapRandChoiced(numMainMeasure,numMainMeasureBeat,mixMap)

randPattern = randMixMap(0);
randMeasure = randMixMap(1);
randBeat = randMixMap(2);

PatternMixChoiced = mixMap.patternMixMap(randPattern,:);
measureMixChoiced = mixMap.measureMixMap(randMeasure,:);
beatMixChoiced = mixMap.beatMixMap(randBeat,:);

mPatternfix= fix(numMainMeasure/4);
for i = 1 : mPatternfix
    mPatternmod = mod(i,4);

    %pMtemplate = PatternMixChoiced;
    %pMtemplate(1,i)
    for k = 1 : numMainMeasure
        mPatternfix = fix(k/4);
        mPatternmod = fix(k/4);
        mMtemplate = measureMixChoiced;
        mMtemplate(1,k);
        
        mixMapChoice.measureMix(1,mPatternfix).mixMap = cat(1, mixMapChoice.measureMix(1,mPatternfix).mixMap, mMtemplate+PatternMixChoiced(1,mPatternfix));

        for k = 1 : numMainMeasureBeat
            bMtemplate = beatMixChoiced;
            mixMapChoice.measureMix(1,i).beat(1,k).mixMap = cat(1, mixMapChoice.measure(1,i).beat(1,k).mixMap, bMtemplate+PatternMixChoiced(1,mPatternfix));
        end
    end
end
