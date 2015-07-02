function gaDat = SFCFitnessOperation(gaDat,pPopu)
chrom = gaDat.chromsome;
totalNumMainMeasure = gaDat.mainImportInfo.mainMeasureNumProperty.totalNumMainMeasure;

chorusPoint = gaDat.mainImportInfo.chorusPoint;
chorusStart = chorusPoint(1,1);
chorusEnd = chorusPoint(1,2);

chorusLength = chorusEnd - chorusStart;
verseLength = totalNumMainMeasure - chorusLength;

for pMeasure = 1 : totalNumMainMeasure
    chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel = [];
    chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity = [];
end
%% create sfcMeasureDensityTrace sfcMeasureBassLevelTrace in every measure
for pMeasure = 1 : totalNumMainMeasure
    sfcMeasureDensityTrace = [];
    sfcMeasureBassLevelTrace = [];
    sizeOfSFCNote = size(chrom(1,pPopu).measure(1,pMeasure).noteContent,1);
    pFix = 0;
    for pSFCNote = 1 : sizeOfSFCNote
        % the note  tag representing how long this note and start from
        % here so if not equal 0 then we add in it
        if chrom(1,pPopu).measure(1,pMeasure).noteContent(pSFCNote,3) ~= 0
            sfcMeasureDensityTrace(pSFCNote - pFix,1) = chrom(1,pPopu).measure(1,pMeasure).noteContent(pSFCNote,3);
        else
            pFix = pFix + 1;
        end
    end
    clearvars pSFCNote pFix
    
    pFix = 0;
    for pSFCNote = 1 : sizeOfSFCNote
        % find Bass lower then c4 and not 0 and check the velocity not 0
        noteTrace = chrom(1,pPopu).measure(1,pMeasure).noteContent(pSFCNote,5);
        if noteTrace <= 48 && noteTrace >= 12 && chrom(1,pPopu).measure(1,pMeasure).noteContent(pSFCNote,6) ~= 0
            sfcMeasureBassLevelTrace(pSFCNote - pFix,1) = chrom(1,pPopu).measure(1,pMeasure).noteContent(pSFCNote,5);
        else
            pFix = pFix + 1;
        end
    end
    chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity = sfcMeasureDensityTrace;
    gaDat.chromsome(1,pPopu).measure(1,pMeasure).sfcMeasureDensity =  sfcMeasureDensityTrace;
    chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel = sfcMeasureBassLevelTrace;
    gaDat.chromsome(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel = sfcMeasureBassLevelTrace;
end
clearvars pMeasure pBeat pFix pSFCNote
%% got sfcVerseDensityWeightTotal
densityWeightMap = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 0;16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 0];
verseSizeOfSFCNote = 0;
sfcVerseDensityWeightTotal = 0;
for pMeasure = 1 : chorusStart - 1
    sizeOfSFCD = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity,1);
    verseSizeOfSFCNote = sizeOfSFCD + verseSizeOfSFCNote;
    for pNote  = 1 : sizeOfSFCD %%"cL" for step with sample chord length
        noteTrace= chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity(pNote,1);
        noteWeightMapIndex = find(noteTrace == densityWeightMap(1,:),1,'first');
        if isempty(noteWeightMapIndex) == 1
            noteWeightMapIndex =  17;
        end
        sfcVerseDensityWeightTotal = densityWeightMap(2,noteWeightMapIndex) + sfcVerseDensityWeightTotal;
    end
end

clearvars pMeasure pBeat pFix sizeOfSFCD sizeOfSFCBL pNote noteTrace noteWeightMapIndex
if chorusEnd < totalNumMainMeasure
    for pMeasure = chorusEnd+1 : totalNumMainMeasure
        sizeOfSFCD = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity,1);
        verseSizeOfSFCNote = sizeOfSFCD + verseSizeOfSFCNote;
        for pNote  = 1 : sizeOfSFCD %%"cL" for step with sample chord length
            noteTrace= chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity(pNote,1);
            noteWeightMapIndex = find(noteTrace == densityWeightMap(1,:),1,'first');
            if isempty(noteWeightMapIndex) == 1
                noteWeightMapIndex =  17;
            end
            sfcVerseDensityWeightTotal = densityWeightMap(2,noteWeightMapIndex)+ sfcVerseDensityWeightTotal;
        end
    end
end
%% got sfcVerseDensityWeightAvg fix verseLength
sfcVerseDensityWeightAvg = sfcVerseDensityWeightTotal / verseLength;
sfcVerseDensityWeightAvg = round(sfcVerseDensityWeightAvg);
clearvars pMeasure pBeat pFix sizeOfSFCD sizeOfSFCBL pNote noteTrace noteWeightMapIndex
%% got sfcChorusDensityWeightTotal
chorusSizeOfSFCNote = 0;
sfcChorusDensityWeightTotal = 0;
for pMeasure = chorusStart : chorusEnd
    sizeOfSFCD = size( chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity,1);
    chorusSizeOfSFCNote = sizeOfSFCD + chorusSizeOfSFCNote;
    for pNote  = 1 : sizeOfSFCD %%"cL" for step with sample chord length
        noteTrace = chrom(1,pPopu).measure(1,pMeasure).sfcMeasureDensity(pNote,1);
        noteWeightMapIndex = find(noteTrace == densityWeightMap(1,:),1,'first');
        if isempty(noteWeightMapIndex) == 1
            noteWeightMapIndex =  17;
        end
        sfcChorusDensityWeightTotal = densityWeightMap(2,noteWeightMapIndex)+ sfcChorusDensityWeightTotal;
    end
end
%% got sfcChorusDensityWeightAvg  fix chorusLength
sfcChorusDensityWeightAvg = sfcChorusDensityWeightTotal / chorusLength;
sfcChorusDensityWeightAvg = round(sfcChorusDensityWeightAvg);
clearvars pMeasure pBeat pFix sizeOfSFCD pNote noteTrace noteWeightMapIndex

%%
sfcDensityWeight = sfcChorusDensityWeightAvg - sfcVerseDensityWeightAvg;
sfcDensityWeightVar = sfcChorusDensityWeightAvg/sfcVerseDensityWeightAvg;
%%{
if sfcChorusDensityWeightAvg > 512
    sfcDensityWeight = sfcDensityWeight*0.1;
end
if sfcDensityWeightVar>10
    sfcDensityWeight = sfcDensityWeight*0.3;
elseif sfcDensityWeightVar > 9 && sfcDensityWeightVar <= 10
    sfcDensityWeight = sfcDensityWeight*0.4;
elseif sfcDensityWeightVar > 8 && sfcDensityWeightVar <= 9
    sfcDensityWeight = sfcDensityWeight*0.6;
else
end
%}
sfcDensityWeight = sfcDensityWeight/10;
%% got sfcVerseBassLevelTotal
verseSizeOfSFCNote = 0;
sfcVerseBassLevelTotal =0;
for pMeasure = 1 : chorusStart - 1
    if isempty(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel) == 0
        sizeOfSFCD = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel);
        verseSizeOfSFCNote = sizeOfSFCD + verseSizeOfSFCNote;
        numsBass = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel(:,1),1);
        sfcVerseBassLevelTotal = numsBass + sfcVerseBassLevelTotal;
    else
        sfcVerseBassLevelTotal = sfcVerseBassLevelTotal + 0;
    end
end
clearvars pMeasure pBeat pFix sizeOfSFCD pNote noteTrace noteWeightMapIndex

if chorusEnd < totalNumMainMeasure
    for pMeasure = chorusEnd+1 : totalNumMainMeasure
        if isempty(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel) == 0
            sizeOfSFCD = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel);
            verseSizeOfSFCNote = sizeOfSFCD + verseSizeOfSFCNote;
            numsBass = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel(:,1),1);
            sfcVerseBassLevelTotal = numsBass + sfcVerseBassLevelTotal;
        else
            sfcVerseBassLevelTotal = sfcVerseBassLevelTotal + 0;
        end
    end
end
%% got sfcVerseBassLevelAvg fix verseLength
sfcVerseBassLevelAvg = sfcVerseBassLevelTotal / verseLength;
sfcVerseBassLevelAvg = round(sfcVerseBassLevelAvg);
clearvars pMeasure pBeat pFix sizeOfSFCD sizeOfSFCBL
%% got sfcChorusBassLevelTotal
chorusSizeOfSFCNote = 0;
sfcChorusBassLevelTotal =0;
for pMeasure = chorusStart : chorusEnd
    if isempty(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel) == 0
        chorusSizeOfSFCNote = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel) + chorusSizeOfSFCNote;
        numsBass = size(chrom(1,pPopu).measure(1,pMeasure).sfcMeasureBassLevel(:,1),1);
        sfcChorusBassLevelTotal = numsBass + sfcChorusBassLevelTotal;
    else
        sfcVerseBassLevelTotal = sfcVerseBassLevelTotal + 0;
    end
end
%% got sfcChorusBassLevelAvg  fix chorusLength
sfcChorusBassLevelAvg = sfcChorusBassLevelTotal / chorusLength;
sfcChorusBassLevelAvg = round(sfcChorusBassLevelAvg);
clearvars pMeasure pBeat pFix sizeOfSFCNote
%%
sfcBassLevelWeight = sfcChorusBassLevelAvg - sfcVerseBassLevelAvg;
if sfcBassLevelWeight >= 50
    sfcBassLevelWeight = sfcBassLevelWeight*0.1;
elseif sfcBassLevelWeight >= 40 && sfcBassLevelWeight < 50
    sfcBassLevelWeight = sfcBassLevelWeight*0.8;
elseif sfcBassLevelWeight > 30 && sfcBassLevelWeight < 40
    sfcBassLevelWeight = sfcBassLevelWeight*0.6;
end
%%
if gaDat.gen >1
    if pPopu == gaDat.indicesXov(1,1)
        gaDat.sfcDensityWeightVar1 = sfcDensityWeightVar;
        gaDat.sfcChorusDensityWeightAvg1 = sfcChorusDensityWeightAvg;
        gaDat.sfcVerseDensityWeightAvg1 = sfcVerseDensityWeightAvg;
        gaDat.sfcBassLevelWeight1 = sfcBassLevelWeight;
        sfcChorusDensityWeightAvg
        sfcVerseDensityWeightAvg
    end
    if pPopu == gaDat.indicesXov(1,2)
        gaDat.sfcDensityWeightVar2 = sfcDensityWeightVar;
        gaDat.sfcChorusDensityWeightAvg2 = sfcChorusDensityWeightAvg;
        gaDat.sfcVerseDensityWeightAvg2 = sfcVerseDensityWeightAvg;
        gaDat.sfcBassLevelWeight2 = sfcBassLevelWeight;
        sfcChorusDensityWeightAvg
        sfcVerseDensityWeightAvg
    end
end

%%
gaDat.chromsome(1,pPopu).sfcDensityWeight = sfcDensityWeight;
gaDat.chromsome(1,pPopu).sfcBassLevelWeight = sfcBassLevelWeight;


