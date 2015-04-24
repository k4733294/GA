function gaDat = StructNoteTable(gaDat)

endOfii = size(gaDat.mainImportInfo,2);
for i = 1 : endOfii
    midiInfoStruct = gaDat.mainImportInfo(1,i);
    midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
    gaDat.mainImportInfo(1,i).measure = midiInfoStruct.measure ;

    sizeCMImeasure = size(gaDat.mainImportInfo(1,i).measure,2);
    sizeCMImeasureFix = fix(sizeCMImeasure/4);
    sizeCMImeasureMod = mod(sizeCMImeasure,4);
    
    if sizeCMImeasureMod ~=0;
        disp('warning StructNoteTableCreate mainImportInfo not fully loop with 4 measure fix in SBC ');
        disp(gaDat.mainImportInfo(1,i).midiString);
    end
    if sizeCMImeasureFix <= 0
        disp('warning StructNoteTableCreate mainImportInfo not full with 4 measure  fix in SBC');
        disp(gaDat.mainImportInfo(1,i).midiString);
    end
    sizeM = size(midiInfoStruct.measure,2);
    for j = 1 : sizeM
        sizeBeatInM = size(midiInfoStruct.measure(1,j).beat,2);
        sizeBeatInMMod = mod(sizeBeatInM,4);
        if sizeBeatInMMod ~= 0
            disp('warning StructNoteTableCreate mainImportInfo not full with 4 beatInMeasure  fix in SBC');
            disp(gaDat.mainImportInfo(1,i).midiString);
            pause
        end
    end
end

endOfii = size(gaDat.chordImportInfo,2);
for i = 1 : endOfii
    midiInfoStruct = gaDat.chordImportInfo(1,i);
    midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
    gaDat.chordImportInfo(1,i).measure = midiInfoStruct.measure ;

    sizeCMImeasure = size(gaDat.chordImportInfo(1,i).measure,2);
    sizeCMImeasureFix = fix(sizeCMImeasure/4);
    sizeCMImeasureMod = mod(sizeCMImeasure,4);
    
    if sizeCMImeasureMod ~=0;
        disp('warning StructNoteTableCreate chordImportInfo not fully loop with 4 measure fix in SBC ');
        disp(gaDat.chordImportInfo(1,i).midiString);
    end
    if sizeCMImeasureFix <= 0
        disp('warning StructNoteTableCreate chordImportInfo not full with 4 measure  fix in SBC');
        disp(gaDat.chordImportInfo(1,i).midiString);
    end
    
    sizeM = size(midiInfoStruct.measure,2);
    for j = 1 : sizeM
        sizeBeatInM = size(midiInfoStruct.measure(1,j).beat,2);
        sizeBeatInMMod = mod(sizeBeatInM,4);
        if sizeBeatInMMod ~= 0
            disp('warning StructNoteTableCreate chordImportInfo not full with 4 beatInMeasure  fix in SBC');
            disp(gaDat.chordImportInfo(1,i).midiString);
            disp(sizeM);
            pause
        end
    end
end

endOfii = size(gaDat.defaultImportInfo,2);
for i = 1 : endOfii
    midiInfoStruct = gaDat.defaultImportInfo(1,i);
    midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct);
    gaDat.defaultImportInfo(1,i).measure = midiInfoStruct.measure ;

    sizeCMImeasure = size(gaDat.defaultImportInfo(1,i).measure,2);
    sizeCMImeasureFix = fix(sizeCMImeasure/4);
    sizeCMImeasureMod = mod(sizeCMImeasure,4);
    
    if sizeCMImeasureMod ~=0;
        disp('warning StructNoteTableCreate defaultImportInfo not fully loop with 4 measure fix in SBC ');
        disp(gaDat.defaultImportInfo(1,i).midiString);
    end
    if sizeCMImeasureFix <= 0
        disp('warning StructNoteTableCreate defaultImportInfo not full with 4 measure  fix in SBC');
        disp(gaDat.defaultImportInfo(1,i).midiString);
    end
    
    sizeM = size(midiInfoStruct.measure,2);
    for j = 1 : sizeM
        sizeBeatInM = size(midiInfoStruct.measure(1,j).beat,2);
        sizeBeatInMMod = mod(sizeBeatInM,4);
        if sizeBeatInMMod ~= 0
            disp('warning StructNoteTableCreate defaultImportInfo not full with 4 beatInMeasure  fix in SBC');
            disp(gaDat.defaultImportInfo(1,i).midiString);
            pause
        end
    end
end
