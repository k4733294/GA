function sampleFrameChoice = sampleFrameChoiceOutput(sampleFrameChoice,gaDat)


sampleFrameChoice = SFCRestruct(sampleFrameChoice);

for i = 1:32
gaDat = AddtoChromesome(gaDat,1,i,sampleFrameChoice);
end

ChromsomeExport(gaDat);