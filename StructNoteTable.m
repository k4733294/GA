function gaDat = StructNoteTable(gaDat)

endOfii = size(gaDat.mainImportInfo,2);
for i = 1 : endOfii
midiInfoStruct = gaDat.mainImportInfo;
midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
gaDat.mainImportInfo = midiInfoStruct ;
end

endOfii = size(gaDat.chordImportInfo,2);
for i = 1 : endOfii
midiInfoStruct = gaDat.chordImportInfo;
midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
gaDat.chordImportInfo = midiInfoStruct ;
end

endOfii = size(gaDat.defaultImportInfo,2);
for i = 1 : endOfii
midiInfoStruct = gaDat.defaultImportInfo;
midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
gaDat.defaultImportInfo = midiInfoStruct ;
end