function sampleFrameChoice = SFCRestruct(sampleFrameChoice)

%{
csSize = size(sampleFrameChoice,2);
for csIndex = 1 : csSize
    csmSize = size(sampleFrameChoice(1,csIndex).measure,2);
    for csmIndex = 1:csmSize
        cS = sampleFrameChoice(1,csIndex).measure(1,csmIndex).beat;
        cSbSize = size(cS,2);
        noteIndexTotal = 0;
        for k = 1 : cSbSize
            startFix = 0;
             if cS(1,k).noteContent(1,1) ~= 1
                startFix = cS(1,k).noteContent(1,1);
                cS(1,k).noteContent(:,1) = cS(1,k).noteContent(:,1)-(startFix - 1);
             end
             if cS(1,k).noteContent(1,1) == startFix 
                noteIndexTotal = noteIndexTotal - 1;
            else
           %noteIndexTotal do not fix
             end
            cS(1,k).noteContent(:,1) = cS(1,k).noteContent(:,1) + noteIndexTotal ;
            noteIndex = max(cS(1,k).noteContent(:,1));
            noteIndexTotal = noteIndexTotal + noteIndex ;
        end
        sampleFrameChoice(1,csIndex).measure(1,csmIndex).beat = cS;
    end
end
%}

csSize = size(sampleFrameChoice,2);
for i = 1 : csSize
    csmSize = size(sampleFrameChoice(1,i).measure,2);
    for j = 1:csmSize
        noteTrack = ChordStructCompare(sampleFrameChoice(1,i).measure(1,j),1);
        sampleFrameChoice(1,i).measure(1,j).noteContent = noteTrack;
    end
end




    
    