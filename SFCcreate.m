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
    sampleFrameChoiceMatrix(1,i).sizeOfSFCM = size(sampleFrameChoiceMatrix(1,i).measure,2);
end


mainMeasureSize = size(2,mixMapChoice.measureMix);
for measureIndex = 1 : mainMeasureSize
    %choice sel by measure is all zero (donothing) or have 1(choice from another sfc) in it
    beatInMeasure = size(2,mixMapChoice.measureMix.mixMap);
    measureChoice = max(beatInMeasure);
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
sampleFrameChoice.mixMapChoice = mixMapChoice;
