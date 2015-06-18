function gaDat = IxovRestruct(gaDat,indicesXov)
sizeOfindicesXov = size(indicesXov,2);
for pChrom = 1: sizeOfindicesXov
     noteTrack = ChordStructCompare(gaDat.chromsome(1,indicesXov(1,pChrom)),0);
    gaDat.chromsome(1,indicesXov(1,pChrom)).notesInTheMeasure = noteTrack;
    gaDat = NoteTableToBarBeatStruct(gaDat,indicesXov(1,pChrom));
end