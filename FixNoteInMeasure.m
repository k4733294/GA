function  chordImportInfo = FixNoteInMeasure(chordImportInfo)

temp = chordImportInfo.notesInTheMeasure(5:262,:);

chordImportInfo.notesInTheMeasure = temp;


fixIndex = chordImportInfo.notesInTheMeasure(1,1);    

chordImportInfo.notesInTheMeasure(:,1) = chordImportInfo.notesInTheMeasure(:,1) - fixIndex + 1;