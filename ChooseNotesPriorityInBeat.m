function notePriorityInBeat = ChooseNotesPriorityInBeat(notesRank,pMeasure,pBeat)
localpBeat = pBeat;
localpMeasure = pMeasure;
usingForwarOfBackLoop = 0;
if isempty(notesRank.measre(1,localpMeasure).beat(1,localpBeat).rankByLength)==1
    forward = 1;
    while isempty(notesRank.measre(1,localpMeasure).beat(1,localpBeat + forward).rankByLength) == 1
        SizeOfbeat = size(notesRank.measre(1,localpMeasure).beat);
        forward = forward +1;
        if localpBeat + forward >= SizeOfbeat
            if localpMeasure > pMeasure
                if usingForwarOfBackLoop ==0
                    localpMeasure = localpMeasure+1;
                end
            else
                localpMeasure = localpMeasure-1;
                usingForwarOfBackLoop = 1;
            end
            localpBeat = 1;
            forward =0;
        end
        
    end
    notePriorityInBeat = notesRank.measre(1,localpMeasure).beat(1,localpBeat + forward).rankByLength(1,:);
else
    notePriorityInBeat = notesRank.measre(1,localpMeasure).beat(1,localpBeat).rankByLength(1,:); 
end

%notePriorityInBeat = notesRank.measre(1,localpMeasure).beat(1,pBeat).rankByPitch; 
% count by notes length is more then others
% sort notes is low freq more then others (find bassline)
