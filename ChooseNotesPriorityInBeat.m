function notePriorityInBeat = ChooseNotesPriorityInBeat(notesRank,pMeasure,pBeat)

if isempty(notesRank.measre(1,pMeasure).beat(1,pBeat).rankByLength)==1
    forward = 1;
    SizeOfbeat = size(notesRank.measre(1,pMeasure).beat);
    if pBeat + forward >= SizeOfbeat
        pMeasure = pMeasure+1;
        pBeat = 1;
    end
    while isempty(notesRank.measre(1,pMeasure).beat(1,pBeat + forward).rankByLength) == 1
        SizeOfbeat = size(notesRank.measre(1,pMeasure).beat);
         forward = forward +1;
        if pBeat + forward >= SizeOfbeat
            pMeasure = pMeasure+1;
            pBeat = 1;
        end
    end
    notePriorityInBeat = notesRank.measre(1,pMeasure).beat(1,pBeat+forward).rankByLength(1,:);
else
    notePriorityInBeat = notesRank.measre(1,pMeasure).beat(1,pBeat).rankByLength(1,:); 
end

%notePriorityInBeat = notesRank.measre(1,pMeasure).beat(1,pBeat).rankByPitch; 
% count by notes length is more then others
% sort notes is low freq more then others (find bassline)
