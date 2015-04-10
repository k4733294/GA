function noteTrack = ChordStructCompare(chordStruct,mode)

if mode == 0
    cS = chordStruct.measure;
elseif mode ==1
    cS = chordStruct.beat;
elseif mode ==2
    cS = chordStruct.note;
end

cSmSize = size(cS,2);
sizeOfNoteTrack = 0;
for j = 1 : cSmSize
    sizeOfNoteTrack = size(cS(1,j).noteContent,1) + sizeOfNoteTrack;
end
sizeOfNoteTrackInfo = size(cS(1,j).noteContent,2);
noteTrack = zeros(sizeOfNoteTrack,sizeOfNoteTrackInfo);
noteInpStart = 1;
noteIndexTotal = 0;
for k = 1 : cSmSize
    noteInpEnd= size(cS(1,k).noteContent,1);      
    noteInpEnd = noteInpStart + noteInpEnd -1;
    startFix = 0;
    if cS(1,k).noteContent(1,1) ~= 1
       startFix = cS(1,k).noteContent(1,1);
       cS(1,k).noteContent(:,1) = cS(1,k).noteContent(:,1)-(startFix - 1);
    end
    noteTrack(noteInpStart:noteInpEnd,:) = cS(1,k).noteContent;
    if noteInpStart == 1
        noteTrack(noteInpStart:noteInpEnd,1) = cS(1,k).noteContent(:,1);
    else
        if noteTrack(noteInpStart-1,1) == startFix 
            noteIndexTotal = noteIndexTotal -1 ;
        else
           %noteIndexTotal do not fix
        end
        noteTrack(noteInpStart:noteInpEnd,1) = cS(1,k).noteContent(:,1) + noteIndexTotal ;
    end
    noteIndex = max(cS(1,k).noteContent(:,1));
    noteIndexTotal = noteIndexTotal + noteIndex ;
    noteInpStart = noteInpEnd + 1;
end
