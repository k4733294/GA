function notePriorityInBeat = ChooseNotesPriorityInBeat(notesRank,pMeasure,pBeat)

%{
notesRank,
pMeasure,
pBeat,
samplePropertiesChoice,
sampleNumChoice,
sampleFrameChoice
%}

notePriorityInBeat = notesRank.measre(1,pMeasure).beat(1,pBeat).top;  





% count by notes length is more then others
% sort notes is low freq more then others (find bassline)
