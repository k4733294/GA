function sampleFrameChoice = SFCcreate(mixMapChoice,gaDat)


%% rand choicing sample from importsamplebeat or defaultsamplebeat
%   setting probability   importsamplebeat 20%  defautsamplebeat 80%
    samplePropertiesChoice = getRandSampleProperties();
%% sample choiced
%   choice which frame in that properties we want
    sampleNumChoice = SPC(gaDat,samplePropertiesChoice);
%% choice Data Actually from 
    sampleFrameChoice = SBC(gaDat,sampleNumChoice,samplePropertiesChoice); 
 
 mMpatternSize = size(2,mixMapChoice.measureMix);
 bMSize = size(2,mixMapChoice.measureMix.beat);
for i = 1 : mMpatternSize
    mixMapMIndex = size(1,mixMapChoice.measureMix(1,i).mixMap);
    for j = 1 : bMSize
        mixMapBIndex = size(1,mixMapChoice.measureMix(1,i).beat(1,j).mixMap);
    end
end

%{
if randMeasure == 5
    %donothing
    if randBeat == 12
        %donothing
    else       
    end
else    
end
%}
