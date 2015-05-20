function sampleFrameChoice = PatternMutate(samplePriorityNote,sampleFrameChoice,pChorusMeasure,pChorusBeat,chordLength)


octave = 12;
for inbeat = pChorusBeat : pChorusBeat + chordLength - 1
    modNotesInBeat = mod(sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(:,5),12);
    noteAddIndexs = find(modNotesInBeat == samplePriorityNote);
    sizeOfNoteAddIndexs = size(noteAddIndexs,1);
    for nAIndex = 1 : sizeOfNoteAddIndexs
        %% got the timeslide info for we insert node
        timeNow = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),1);
        timeNowIndexs = find(sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(:,1) == timeNow);
        timeInsert = timeNowIndexs(end,1);
        %% pull out note we need and fix note octave info represent big bass
        noteAdd = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),:);
        noteAdd(1,5) = samplePriorityNote + octave*2;
        noteAdd(1,4) = 2;
        %% first part is above of noteAdd 
        tempFromStart = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(1: timeInsert,:);
        %% second part is belowd of noteAdd
        % one of +1 is noteAdd 
        tempFromInserted = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(timeInsert + 1 : end,:);
        %% 
        TimeOfNoteAddIndexs = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(:,1),1);
        Now = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),1);
        endOfSame = find(TimeOfNoteAddIndexs == Now,1,'last');
         if noteAdd(1,5) ~= sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),5);
           noteAddIndexs(endOfSame+1 : end,1) = noteAddIndexs(endOfSame+1 : end,1) + 1;
        end
        
        %% append both of two parts and noteAdd insert
        if noteAdd(1,5) ~= sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),5);
            sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent = [tempFromStart ; noteAdd ; tempFromInserted];
        end
     end
end
