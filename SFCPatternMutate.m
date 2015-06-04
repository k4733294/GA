function sampleFrameChoice = SFCPatternMutate(sampleFrameChoice,sfcNotesRank,gaDat,chordLength)

%setting DoMutate risk
randDoMutate = randi([1,10]);

if randDoMutate <= 5
    chorusPoint = gaDat.mainImportInfo.chorusPoint;
    startChorus = chorusPoint(1,1);
    endChorus = chorusPoint(1,2);
    for pChorusMeasure = startChorus : endChorus
        sizeOfBeat= size(sfcNotesRank.measure(1,pChorusMeasure).beat,2);
        for pChorusBeat = 1 : chordLength : sizeOfBeat
            samplePriorityNote = sfcNotesRank.measure(1,pChorusMeasure).beat(1,pChorusBeat).samplePriorityNote;
            sampleFrameChoice = PatternMutate(samplePriorityNote,sampleFrameChoice,pChorusMeasure,pChorusBeat,chordLength);
            sampleFrameChoice.measure(1,pChorusMeasure).patternVariance = sampleFrameChoice.measure(1,pChorusMeasure).patternVariance+1;
        end
    end
end
