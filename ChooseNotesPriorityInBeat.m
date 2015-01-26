function notePriorityInBeat = ChooseNotesPriorityInBeat(notesRank,pMeasure,pBeat)


notePriorityInBeat = notesRank.measre(1,pMeasure).beat(1,pBeat).rankByLength(1,:);  
%notePriorityInBeat = notesRank.measre(1,pMeasure).beat(1,pBeat).rankByPitch; 





% count by notes length is more then others
% sort notes is low freq more then others (find bassline)
