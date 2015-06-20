function selChXov = NoteTableToBarBeatStruct4SelChXov(selChXov,gaDat,IndicesMuta)

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

endOfNITM = size(selChXov.notesInTheMeasure,1);
for i = 1: endOfNITM
    reStruct.measure(mLtemp).noteContent(mcount,:) = selChXov.notesInTheMeasure(i,:);
    reStruct.measure(mLtemp).beat(bLtemp).noteContent(bcount,:) = selChXov.notesInTheMeasure(i,:);
    
    if i ~= endOfNITM
        preDectect = i+1;
    else
        preDectect = i;
    end
    
    mcountEnd = mod(selChXov.notesInTheMeasure(i,1),mLbL);
    if mcountEnd == 0
        if mcountEnd ~= mod(selChXov.notesInTheMeasure(preDectect,1),mLbL)
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
    
    bcountEnd = mod(selChXov.notesInTheMeasure(i,1),bL);
    if bcountEnd == 0
        if bcountEnd ~= mod(selChXov.notesInTheMeasure(preDectect,1),bL)
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
        selChXov.measure(mLloop).noteContent = reStruct.measure(mLloop).noteContent;
        selChXov.measure(mLloop).beat(bLloop).noteContent = reStruct.measure(mLloop).beat(bLloop).noteContent ;
    end
end