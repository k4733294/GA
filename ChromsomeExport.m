function ChromsomeExport(gaDat)

%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDatCreatedAddchromsome.mat');

csSize = size(gaDat.chromsome,2);
for i = 1 : csSize
    noteTrack = ChordStructCompare(gaDat.chromsome(1,i),0);
    gaDat.chromsome(1,i).notesInTheMeasure = noteTrack;
    gaDat.chromsome(1,i).ticksPerQuarterNote = gaDat.mainImportInfo.ticksPerQuarterNote;
    csNum = int2str(i);
    version = strcat('ChormSome',csNum);
    Melodyexport(gaDat.chromsome(1,i),version);
end

