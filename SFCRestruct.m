function sampleFrameChoice = SFCRestruct(sampleFrameChoice)


csSize = size(sampleFrameChoice,2);
for i = 1 : csSize
    csmSize = size(sampleFrameChoice(1,i).measure,2);
    for j = 1:csmSize
        noteTrack = ChordStructCompare(sampleFrameChoice(1,i).measure(1,j),1);
        sampleFrameChoice(1,i).measure(1,j).noteContent = noteTrack;
    end
end






    
    