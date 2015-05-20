function sfcNotesRank = SFCNotesRankCreate(sampleFrameChoice,chordLength,gaDat)

mainMeasureNumProperty = getMainMeasureNumProperty(gaDat);
numMainMeasure = mainMeasureNumProperty.totalNumMainMeasure;
 for pMeasure = 1 : numMainMeasure
    numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
    for pBeat  = 1 : chordLength : numMainMeasureBeat %%"cL" for step with sample chord length
         sfcNPMatrix = NotePriorityMatrix(sampleFrameChoice.measure(1,pMeasure),chordLength,pBeat);
        %% choising the note in chord array ane the note is nearly mainPriorityNote
         sfcNPMatrix = BassNoteInChordMatrix(sfcNPMatrix,pBeat);
        %% nil which bassnote we want
        %% output BassNote We need
         sfcNPMatrix = BassNoteChoice(sfcNPMatrix,pBeat);
         sfcNotesRank.measure(1,pMeasure).beat(1,pBeat) = sfcNPMatrix.beat(1,pBeat);
    end
 end