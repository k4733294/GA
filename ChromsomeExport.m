function ChromsomeExport(gaDat)

%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDatCreatedAddchromsome.mat');

csSize = size(gaDat.chromsome,2);
for i = 1 : csSize
    csmSize = size(gaDat.chromsome(1,i).measure,2);
    sizeOfNoteTrack = 0;
    for j = 1 : csmSize
        sizeOfNoteTrack = size(gaDat.chromsome(1,i).measure(1,j).noteContent,1) + sizeOfNoteTrack;
    end
    sizeOfNoteTrackInfo = size(gaDat.chromsome(1,i).measure(1,j).noteContent,2);
    noteTrack = zeros(sizeOfNoteTrack,sizeOfNoteTrackInfo);
    noteInpStart = 1;
    noteIndexTotal = 0;
    for k = 1 : csmSize
        noteInpEnd= size(gaDat.chromsome(1,i).measure(1,k).noteContent,1);      
        noteInpEnd = noteInpStart + noteInpEnd -1;
        if gaDat.chromsome(1,i).measure(1,k).noteContent(1,1) ~= 1
           startFix = gaDat.chromsome(1,i).measure(1,k).noteContent(1,1);
           gaDat.chromsome(1,i).measure(1,k).noteContent(:,1) = gaDat.chromsome(1,i).measure(1,k).noteContent(:,1)-(startFix - 1);
        end
        noteTrack(noteInpStart:noteInpEnd,:) = gaDat.chromsome(1,i).measure(1,k).noteContent;
        if noteInpStart == 1
            noteTrack(noteInpStart:noteInpEnd,1) = gaDat.chromsome(1,i).measure(1,k).noteContent(:,1);
        else
            noteTrack(noteInpStart:noteInpEnd,1) = gaDat.chromsome(1,i).measure(1,k).noteContent(:,1) + noteIndexTotal ;
        end
        noteIndex = max(gaDat.chromsome(1,i).measure(1,k).noteContent(:,1));
        noteIndexTotal = noteIndexTotal + noteIndex ;
        noteInpStart = noteInpEnd + 1;
    end
    gaDat.chromsome(1,i).notesInTheMeasure = noteTrack;
    gaDat.chromsome(1,i).ticksPerQuarterNote = gaDat.mainImportInfo.ticksPerQuarterNote;
    csNum = int2str(i);
    version = strcat('ChormSome',csNum);
    Melodyexport(gaDat.chromsome(1,i),version);
end

