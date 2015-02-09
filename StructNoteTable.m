function gaDat = StructNoteTable(gaDat)

endOfii = size(gaDat.mainImportInfo,2);
for i = 1 : endOfii
midiInfoStruct = gaDat.mainImportInfo(1,i);
midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
gaDat.mainImportInfo(1,i).measure = midiInfoStruct.measure ;
end

endOfii = size(gaDat.chordImportInfo,2);
for i = 1 : endOfii
midiInfoStruct = gaDat.chordImportInfo(1,i);
midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
gaDat.chordImportInfo(1,i).measure = midiInfoStruct.measure ;
end

endOfii = size(gaDat.defaultImportInfo,2);
for i = 1 : endOfii
midiInfoStruct = gaDat.defaultImportInfo(1,i);
midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
gaDat.defaultImportInfo(1,i).measure = midiInfoStruct.measure ;
end