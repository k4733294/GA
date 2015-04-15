function mixMapChoice = mixMapRandChoiced(numMainMeasure,numMainMeasureBeat,randMeasure,randBeat,mixMap)

PatternMixChoiced = mixMap.patternMixMap(randPattern,:);
measureMixChoiced = mixMap.measureMixMap(randMeasure,:);
beatMixChoiced = mixMap.beatMixMap(randBeat,:);

%mPatternfix= fix(numMainMeasure/4);
%mPatternmod= fix(numMainMeasure/4);
for i = 1 : numMainMeasure
    mPatternfix = fix(numMainMeasure/4);
    mPatternfix = mod(mPatternfix,4)+1;
    
    if PatternMixChoiced(1,mPatternfix) == 0
        
    else
        
    end
end

        mMtemplate = measureMixChoiced;
        mixMapChoice.measureMix(1,i).mixMap = cat(1, mixMapChoice.measure(1,i).mixMap, mMtemplate);
        for j = 1 : numMainMeasureBeat
            bMtemplate = beatMixChoiced;
            mixMapChoice.measureMix(1,i).beat(1,j).mixMap = cat(1, mixMapChoice.measure(1,i).beat(1,j).mixMap, bMtemplate);
        end