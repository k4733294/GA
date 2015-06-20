function noteAdd = DiffLengthPlus(selChMuta,gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLengthMain)
noteAddIndex = 0;
noteLength = 0;
randNoteLength = randNoteLengthMain;
if noteLenVari > randNoteLength
    noteLenVariCount = noteLenVari;
    fixNoteLenVari = fix(noteLenVari/randNoteLength);
    modNoteLenVari = mod(noteLenVari,randNoteLength);
    crateNoteLen =0 ;
    crateNoteLen = noteLenVari;
    %{
    if modNoteLenVari == 0
        crateNoteLen = fixNoteLenVari;
    else
        crateNoteLen = fixNoteLenVari +1;
    end
    %}
    noteAdd = zeros(crateNoteLen,notePropertyCreate);
    noteAddLoop = 1;
    noteIndexLoop = 0;
    while noteLenVariCount > 0
        noteAdd(noteAddLoop,:) = selChMuta.measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
        if noteLenVariCount >= randNoteLength
            noteAdd(noteAddLoop,3) = randNoteLength;
        elseif noteLenVariCount < randNoteLength && noteLenVariCount >= 0
            noteAdd(noteAddLoop,3) = noteLenVariCount;
        end
        
        if noteIndexLoop == 0
            noteIndexLoop = noteAdd(noteAddLoop,1);
        else
            %noteAdd(noteAddLoop,1) = noteIndexLoop + 1;
        end
        
        if noteAdd(noteAddLoop,3) > 1
            for noteLengthLoop = 1 : noteAdd(noteAddLoop,3)
                noteAdd(noteAddLoop + noteLengthLoop - 1,:) = noteAdd(noteAddLoop,:);
                noteAddIndex = noteIndexLoop + noteLengthLoop -1;
                noteAdd(noteAddLoop + noteLengthLoop - 1,1) = noteAddIndex;
                if noteLengthLoop > 1
                    noteAdd(noteAddLoop + noteLengthLoop - 1,3) = 0;
                end
            end
            if isempty(find(noteAdd(noteAddLoop + noteLengthLoop - 1,1)==noteAdd(1,1),1))==0||isempty(find(noteAdd(1:noteAddLoop + noteLengthLoop - 1,1)==0,1))==0
                disp('index error occur');
            end
            noteLength = noteLengthLoop;
        else
            noteAddIndex = noteIndexLoop + noteLength;
            noteLength =  1;
            noteAdd(noteAddLoop,1) = noteAddIndex ;
             if (isempty(find(noteAdd(noteAddLoop,1)==noteAdd(1,1),1))==0||isempty(find(noteAdd(1:noteAddLoop,1)==0,1))==0)&&noteAddLoop ~= 1
                disp('index error occur');
            end
        end
        noteIndexLoop = noteAddIndex;
        noteAddLoop = noteAddLoop + noteLength;
        noteLenVariCount = noteLenVariCount - randNoteLength;
    end
end
if noteLenVari  <= randNoteLengthMain
    noteAdd = zeros(noteLenVari,notePropertyCreate);
    noteAdd(1,:) = selChMuta.measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
    noteAdd(1,3) = noteLenVari;
    if noteLenVari > 1
        for noteLength = 2 : noteAdd(1,3)
            noteAdd(noteLength,:) = selChMuta.measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
            noteAddIndex = noteAdd(1,1) + noteLength - 1;
            noteAdd(noteLength,1) = noteAddIndex;
            noteAdd(noteLength,3) = 0;
        end
    end
end