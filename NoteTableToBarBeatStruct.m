function gaDat = NoteTableToBarBeatStruct(gaDat,IndicesMuta)

measureLength = gaDat.mainImportInfo.timeSignatureDenominator ;
barLength = gaDat.mainImportInfo.timeSignatureNumerator;

mLtemp = 1;
bLtemp = 1;

mcount = 1;
bcount = 1;

m0sync = false;
b0sync = false;

bL = barLength;
mLbL = measureLength*bL;

endOfNITM = size(gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure,1);
for i = 1: endOfNITM
    reStruct.measure(mLtemp).noteContent(mcount,:) = gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure(i,:);
    reStruct.measure(mLtemp).beat(bLtemp).noteContent(bcount,:) = gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure(i,:);
    
    if i ~= endOfNITM
        preDectect = i+1;
    else
        preDectect = i;
    end
    
    mcountEnd = mod(gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure(i,1),mLbL);
    if mcountEnd == 0
        if mcountEnd ~= mod(gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure(preDectect,1),mLbL)
            m0sync = true ;
        else
            %if m0sameNum ~= midiInfoStruct.notesInTheMeasure(i,1)
            %end
        end
    else
    end
    if m0sync == true
        mcount =1;
        mLtemp = mLtemp + 1;
        m0sync = false;
        %m0sameNum = midiInfoStruct.notesInTheMeasure(i,1);
    else
        mcount = mcount + 1;
    end
    
    bcountEnd = mod(gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure(i,1),bL);
    if bcountEnd == 0
        if bcountEnd ~= mod(gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure(preDectect,1),bL)
            %if b0sameNum ~= midiInfoStruct.notesInTheMeasure(preDectect,1)
            b0sync = true ;
            %end
        end
    end
    if b0sync == true;
        bcount = 1;
        bLtemp = bLtemp + 1;
        b0sync = false;
        %b0sameNum = midiInfoStruct.notesInTheMeasure(preDectect,1);
    else
        bcount = bcount + 1;
    end
    
    if bLtemp <= barLength
    else
        bLtemp = 1;
    end
end

for mLloop = 1 : mLtemp
    for bLloop = 1:barLength
        gaDat.chromsome(1,IndicesMuta(1,1)).measure(mLloop).noteContent = reStruct.measure(mLloop).noteContent;
        gaDat.chromsome(1,IndicesMuta(1,1)).measure(mLloop).beat(bLloop).noteContent = reStruct.measure(mLloop).beat(bLloop).noteContent ;
    end
end
