function selChXov = IxovRestruct(selChXov,gaDat,indicesXov)
sizeOfindicesXov = size(selChXov,2);
for pChrom = 1: sizeOfindicesXov
     noteTrack = ChordStructCompare(selChXov(1,pChrom),0);
    selChXov(1,pChrom).notesInTheMeasure = noteTrack;
    selChXov(1,pChrom) = NoteTableToBarBeatStruct4SelChXov(selChXov(1,pChrom),gaDat,indicesXov);
end