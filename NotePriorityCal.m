function notePriority = NotePriorityCal(gaDat,pBeat,sampleNumChoice,sampleFrameChoice)

gaDat.chordImportInfo(1,1).measure.beat(1,1).noteContent

gaDat.mainImportInfo.measure.beat(1,pBeat).noteContent;
% count by notes length is more then others
% sort notes is low freq more then others (find bassline)
