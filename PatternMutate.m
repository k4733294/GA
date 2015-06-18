function sampleFrameChoice = PatternMutate(samplePriorityNote,sampleFrameChoice,pChorusMeasure,pChorusBeat,chordLength)

maxBeatLength = 16;
octave = 12;
for inbeat = pChorusBeat : pChorusBeat + chordLength - 1
    modNotesInBeat = mod(sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(:,5),12);
    modNotesInBeat(:,2) = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(:,3);
    noteAddIndexsNote = find(modNotesInBeat(:,1) == samplePriorityNote);
    noteAddIndexsStart =  find(modNotesInBeat(:,2) ~= 0);
    noteAddIndexs = intersect(noteAddIndexsNote,noteAddIndexsStart);
    sizeOfNoteAddIndexs = size(noteAddIndexs,1);
    if isempty(noteAddIndexs)==1
        continue
    end
    for nAIndex = 1 : sizeOfNoteAddIndexs
        %% pull out note we need and fix note octave info represent big bass
        %{
        noteLengthCreate = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),3);
        if noteLengthCreate> maxBeatLength
            noteLengthCreate = maxBeatLength;
        end
        %notePropertyCreate = size(sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),:),2);
        %noteAdd = zeros(noteLengthCreate,notePropertyCreate);
        %}
        noteAdd = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),:);
        noteAdd(1,4) = 2;
        
        %noteAddIndexExceedCheck = noteAdd(1,1) + noteAdd(1,3)- 1;
        %if  noteAddIndexExceedCheck > 16
        %noteAdd(1,3) = noteLengthCreate - noteAdd(1,1) + 1;
        %end
        noteAdd(1,5) = samplePriorityNote + octave*2;
        if noteAdd(1,3) <= 0
            disp('nodeAddError');
        end
        %{
        if noteLengthCreate > 1
            for noteLength = 2 : noteAdd(1,3)
                noteAdd(noteLength,:) = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),:);
                noteAdd(noteLength,1) = noteAdd(1,1) + noteLength - 1;
                noteAdd(noteLength,3) = 0;
                noteAdd(noteLength,4) = 2;
                noteAdd(noteLength,5) = samplePriorityNote + octave*2;
            end
        end
        %}
        inBeatFix = inbeat;
        inBeatUse = 0;
        %{
        for noteAddloopIndex = 1 : noteAdd(1,3)
             %% got the timeslide info for we insert node
            timeNow = noteAdd(noteAddloopIndex,1);
            findBeat = 0;
            while findBeat == 0
                timeNowIndexs = find(sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inBeatFix).noteContent(:,1) == timeNow);
                if isempty(timeNowIndexs) == 1
                    inBeatFix = inBeatFix + 1;
                    inBeatUse = 1;
                else
                    findBeat = 1;
                end
            end
        %}
            timeNow = noteAdd(1,1);
            timeNowIndexs = find(sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inBeatFix).noteContent(:,1) == timeNow);
            timeInsert = timeNowIndexs(end,1);
            %% first part is above of noteAdd
            tempFromStart = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inBeatFix).noteContent(1: timeInsert ,:);
            %% second part is belowd of noteAdd
            % one of +1 is noteAdd
            tempFromInserted = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inBeatFix).noteContent(timeInsert + 1 : end,:);
            %%  adjust the noteAddIndexs to the next one
            TimeOfNoteAddIndexs = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(:,1),1);
            Now = sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),1);
            endOfSame = find(TimeOfNoteAddIndexs == Now,1,'last');
            if noteAdd(1,5) ~= sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inbeat).noteContent(noteAddIndexs(nAIndex,1),5);
                if inBeatUse ~=1
                    noteAddIndexs(endOfSame + 1 : end,1) = noteAddIndexs(endOfSame + 1 : end,1) + 1;
                end
                %% append both of two parts and noteAdd insert
                sampleFrameChoice.measure(1,pChorusMeasure).beat(1,inBeatFix).noteContent = [tempFromStart ; noteAdd(1,:) ; tempFromInserted];
            end
       % end
    end
end
