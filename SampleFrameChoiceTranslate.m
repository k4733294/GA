function sampleFrameChoice = SampleFrameChoiceTranslate(sampleFrameChoice,notePriorityInBeat)
%{
gaDat
pBeat
sampleNumChoice
sampleFrameChoice
notePriorityInBeat
samplePropertiesChoice
%}
notePriorityModed= mod(notePriorityInBeat(1,1),12);

sizeOfSFC = size(sampleFrameChoice.noteContent,1);
for i = 1 : sizeOfSFC
    if sampleFrameChoice.noteContent(i,5) ~= -1
        sampleFrameChoice.noteContent(i,5) = sampleFrameChoice.noteContent(i,5) + notePriorityModed;  
    end
end

sizeOfSFCN = size(sampleFrameChoice.note,2);
for i = 1 : sizeOfSFCN
    sizeOfSFCNContent = size(sampleFrameChoice.note(1,i).noteContent,1);
    for j = 1 : sizeOfSFCNContent
        if sampleFrameChoice.note(1,i).noteContent(j,5) ~= -1
        	sampleFrameChoice.note(1,i).noteContent(j,5) = sampleFrameChoice.note(1,i).noteContent(j,5) + notePriorityModed;
    	end
    end 
end


