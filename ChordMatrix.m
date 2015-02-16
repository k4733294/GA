function   cm = ChordMatrix(sampleFrameChoice,pBeat)



sizeOfSFC = size(sampleFrameChoice.beat(1,pBeat).noteContent,1);
for i = 1 : sizeOfSFC
        sampleFrameChoice.beat(1,pBeat).noteContent(i,5) = sampleFrameChoice.beat(1,pBeat).noteContent(i,5) + notePriorityModed;  
end
