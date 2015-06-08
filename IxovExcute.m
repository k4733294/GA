function gaDat = IxovExcute(mixMapChoice,selChXov,indicesXov,gaDat)
chorusPoint = gaDat.mainImportInfo.chorusPoint;
chorusStart = chorusPoint(1,1);
chorusEnd = chorusPoint(1,2);
sampleFrameChoiceMatrix(1,1) = selChXov(1,1);
sampleFrameChoiceMatrix(1,2) = selChXov(1,2);

verseOrChrousTrans = randi(10,1);
if verseOrChrousTrans<5
    tansVerseOnOrChrous = 0; %%0 trans Verse 1 trans Chorus
else
    tansVerseOnOrChrous = 1;
end

mainMeasureSize = size(mixMapChoice.measureMix,2);
for measureIndex = 1 : mainMeasureSize
    measureChoice = max(mixMapChoice.measureMix(1,measureIndex).mixMap);
    if tansVerseOnOrChrous == 0 %% verse trans
        if measureIndex < chorusStart || measureIndex > chorusEnd
            if measureChoice == 0
                gaDat.chromsome(1,indicesXov(1,1)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,1).measure(1,measureIndex);
                gaDat.chromsome(1,indicesXov(1,2)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,2).measure(1,measureIndex);
            else
                gaDat.chromsome(1,indicesXov(1,1)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,2).measure(1,measureIndex);
                gaDat.chromsome(1,indicesXov(1,2)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,1).measure(1,measureIndex);
            end
        end
    else %%chorus trans
        if measureIndex > chorusStart && measureIndex < chorusEnd
            if measureChoice == 0
                gaDat.chromsome(1,indicesXov(1,2)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,1).measure(1,measureIndex);
                gaDat.chromsome(1,indicesXov(1,1)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,2).measure(1,measureIndex);
            else
                gaDat.chromsome(1,indicesXov(1,2)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,2).measure(1,measureIndex);
                gaDat.chromsome(1,indicesXov(1,1)).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,1).measure(1,measureIndex);
            end
        end
    end
end