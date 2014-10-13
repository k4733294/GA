function gaDat = CrtrpV2(gaDat)
%???????? ?????SAMPLE?????
rhythmNum =1;
gaDat.chordImportInfo(rhythmNum);
deltaTimeSixteenthNote = gaDat.chordImportInfo(rhythmNum).ticksPerQuarterNote/4;
measureLengthNoteNum=gaDat.chordImportInfo(rhythmNum).meausreLength/deltaTimeSixteenthNote;
%%
%chromesome chromsome polling standard
%find the measure in same Eigenvalues

%??????RAND???SAMPLE????POPULATION(CHROM)
%gaDat.MAXGEN ??POPULAITON??
%BLOCKNUM????????????????????? ???????

for i =1:gaDat.populationSize
    for j = 1:gaDat.blockSize
        rhythmSampleChoose = randi(1);
        blockChoose = randi([1,2]);    
        if blockChoose == 1
            gaDat.Chrom(i,j).noteInTheBlock = gaDat.chordImportInfo(rhythmSampleChoose).notesInTheMeasure(1:blockChoose*measureLengthNoteNum,:);
            gaDat.Chrom(i,j).noteInTheBlock
        else 
            gaDat.Chrom(i,j).noteInTheBlock = gaDat.chordImportInfo(rhythmSampleChoose).notesInTheMeasure((blockChoose-1)*measureLengthNoteNum:blockChoose*measureLengthNoteNum,:);
            gaDat.Chrom(i,j).noteInTheBlock
        end
    end
 end


%gaDat.Chrom=AdjustMeasureLength(gaDat);

function Chrom=AdjustMeasureLength(gaDat)

number=gaDat.populationSize;
rhythmNumber = gaDat.chordImportInfoRhythmNum;
mNITMs=size(gaDat.mainImportInfo.notesInTheMeasure,1);
cNITMs=size(gaDat.chordImportInfo(rhythmNumber).notesInTheMeasure,1);

for i = 1 : number
count=1;
    if cNITMs>mNITMs
          Chrom(number).chromNotes(1:mNITMs,:) = gaDat.chordImportInfo(rhythmNumber).notesInTheMeasure(1:mNITMs,:);
    elseif cNITMs<mNITMs
        for i= 1 : mNITMs
                Chrom(number).chromNotes(i,:) = gaDat.chordImportInfo(rhythmNumber).notesInTheMeasure(count,:);
                if count == cNITMs
                    count=1;
                else
                    count=count+1;
                end
        end
    else
         Chrom(number).chromNotes= gaDat.chordImportInfo(rhythmNumber).notesInTheMeasure;
    end
end