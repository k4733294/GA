function gaDat = IxovExcute(mixMapChoice,selChXovFst,selChXovSnd,IndicesFst,IndicesSnd,gaDat)
chorusPoint = gaDat.mainImportInfo.chorusPoint;
chorusStart = chorusPoint(1,1);
chorusEnd = chorusPoint(1,2);
sampleFrameChoiceMatrix(1,1) = selChXovFst;
sampleFrameChoiceMatrix(1,2) = selChXovSnd;

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
            sizeOfSFCM = sampleFrameChoiceMatrix(1,1).sizeOfSFCM;
            sFCMChoice = mod(measureIndex,sizeOfSFCM);
            if measureChoice == 0
                gaDat.Chrom(1,IndicesSnd).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,1).measure(1,sFCMChoice + 1);
            else
                gaDat.Chrom(1,IndicesSnd).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,2).measure(1,sFCMChoice + 1);
            end
        end
    else %%chorus trans
        if measureIndex > chorusStart && measureIndex < chorusEnd
            sizeOfSFCM = sampleFrameChoiceMatrix(1,1).sizeOfSFCM;
            sFCMChoice = mod(measureIndex,sizeOfSFCM);
            if measureChoice == 0
                gaDat.Chrom(1,IndicesFst).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,1).measure(1,sFCMChoice + 1);
            else
                gaDat.Chrom(1,IndicesFst).measure(1,measureIndex) = sampleFrameChoiceMatrix(1,2).measure(1,sFCMChoice + 1);
            end
        end 
    end
end