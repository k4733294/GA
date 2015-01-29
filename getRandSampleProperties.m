function samplePropertiesChoice = getRandSampleProperties()

samplePropertiesChoice = randi([1 100]);
        if samplePropertiesChoice > 20
            %%choice from defaultsample 
            samplePropertiesChoice = 1;
        else
            %%choice from importsample 
            samplePropertiesChoice = 0;
        end