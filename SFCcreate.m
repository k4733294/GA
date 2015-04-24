function sampleFrameChoice = SFCcreate(mixMapChoice,gaDat)

for i = 1 : 2
%% rand choicing sample from importsamplebeat or defaultsamplebeat
%   setting probability   importsamplebeat 20%  defautsamplebeat 80%
    samplePropertiesChoice = getRandSampleProperties();
%% sample choiced
%   choice which frame in that properties we want
    sampleNumChoice = SPC(gaDat,samplePropertiesChoice);
%% choice Data Actually from 
    sampleFrameChoiceMatrix(1,i) = SBC(gaDat,sampleNumChoice,samplePropertiesChoice);
end

mainMeasureSize = size(mixMapChoice.measureMix,2);
for measureIndex = 1 : mainMeasureSize
    %choice sel by measure is all zero (donothing) or have 1(choice from another sfc) in it
    measureChoice = max(mixMapChoice.measureMix(1,measureIndex).mixMap);
    % all zero (donothing)
    if measureChoice == 0  
        sizeOfSFCM = sampleFrameChoiceMatrix(1,1).sizeOfSFCM;
        sFCMChoice = mod(measureIndex,sizeOfSFCM);
        sampleFrameChoice.measure(1,measureIndex) = sampleFrameChoiceMatrix(1,1).measure(1,sFCMChoice + 1);
    % beatmatrix  have 1(choice from another sfc) in it    
    else
        sizeOfSFCM = sampleFrameChoiceMatrix(1,2).sizeOfSFCM;
        sFCMChoice = mod(measureIndex,sizeOfSFCM);
        sampleFrameChoice.measure(1,measureIndex) = sampleFrameChoiceMatrix(1,2).measure(1,sFCMChoice + 1);
    end  
end
sampleFrameChoice.chordLength = sampleFrameChoiceMatrix(1,1).chordLength;
sampleFrameChoice.mixMapChoice = mixMapChoice;

