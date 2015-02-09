function sampleFrameChoice = SampleFrameChoiceTranslate(mainTonal,sampleFrameChoice,pBeat,notePriorityInBeat)
%{
gaDat
pBeat
sampleNumChoice
sampleFrameChoice
notePriorityInBeat
samplePropertiesChoice
%}
%%
major=[1 3 5 6 8 10 12]; %  f f h f f f 
minor=[1 3 4 6 8 9 11];   % f h f f h f
%% choose top high priorityBeat
notePriorityModed= mod(notePriorityInBeat(1,1),12);




sizeOfSFC = size(sampleFrameChoice.beat(1,pBeat).noteContent,1);
for i = 1 : sizeOfSFC
    if sampleFrameChoice.beat(1,pBeat).noteContent(i,5) ~= -1
        sampleFrameChoice.beat(1,pBeat).noteContent(i,5) = sampleFrameChoice.beat(1,pBeat).noteContent(i,5) + notePriorityModed;  
    end
end

sizeOfSFCN = size(sampleFrameChoice.beat(1,pBeat).note,2);
for i = 1 : sizeOfSFCN
    sizeOfSFCNContent = size(sampleFrameChoice.beat(1,pBeat).note(1,i).noteContent,1);
    for j = 1 : sizeOfSFCNContent
        if sampleFrameChoice.beat(1,pBeat).note(1,i).noteContent(j,5) ~= -1
        	sampleFrameChoice.beat(1,pBeat).note(1,i).noteContent(j,5) = sampleFrameChoice.beat(1,pBeat).note(1,i).noteContent(j,5) + notePriorityModed;
    	end
    end 
end


