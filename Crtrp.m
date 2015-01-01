function gaDat = Crtrp(gaDat)
%% view the every clip sample output  mainmelo & chord import
%{
for i = 1 : 6
    a = 'title';
    if i <=5
        a = strcat(gaDat.chordImportInfo(i).exportVersion,'.mid');
       
        midi = readmidi(a);
    else
        a = strcat(gaDat.mainImportInfo.exportVersion,'.mid');
        midi = readmidi(a);
    end
Notes = midiInfo(midi,0);
[PR,t,nn] = piano_roll(Notes,1);
figure;
imagesc(t,nn,PR);
title(a);
axis xy;
xlabel('time (sec)');
ylabel('note number');
   
end
%}

%% get the SAMPLE  infomation  about measureLengthNoteNum
rhythmNum =1;
%gaDat.chordImportInfo(rhythmNum);
%deltaTimeSixteenthNote = gaDat.chordImportInfo(rhythmNum).ticksPerQuarterNote/4;
%measureLengthNoteNum=gaDat.chordImportInfo(rhythmNum).meausreLength/deltaTimeSixteenthNote;

%% Change tonal here
endCI = size(gaDat.chordImportInfo,2);
for i = 1 : endCI
    tonalEqual = gaDat.mainImportInfo.tonal == gaDat.chordImportInfo(1,1).tonal;
    
    if tonalEqual(1,1) == 1 && tonalEqual(2,1) == 1
        %do not use Transportmeasure to the same tonal
    else
        chordImportInfo = gaDat.chordImportInfo(1,endCI);
        mainImportInfo = gaDat.mainImportInfo;
        gaDat = Transportmeasure(mainImportInfo,chordImportInfo);
    end
end
 
%% 
%get measure nums
size(gaDat.mainImportInfo.measure,2)
%get measure noteContent total nums
size(gaDat.mainImportInfo.measure.noteContent,1)
%get beat in measure nums
size(gaDat.mainImportInfo.measure.beat,2)
%get beat noteContent total nums
size(gaDat.mainImportInfo.measure.beat(1,1).noteContent,1)
%get note in beat in measure nums
size(gaDat.mainImportInfo.measure.beat(1,1).note,2)
%get note noteContent total nums
size(gaDat.mainImportInfo.measure.beat(1,1).note(1,1).noteContent,1)

%% find something eiganvalue at diffrent length in notes
% eigan1
%calculate eigan1 in every measure
%calculate eigan1 in every beat
%calculate eigan1 in every note
% eigan2
% calculate eigan2 in every measure
%calculate eigan2 in every beat
%calculate eigan2 in every note
%% conclusion the eiganvalue ( for after instuction at sample edit? )
 % way1 true false
 % way2 true false
%% dicide the way to edit  sample to population here
% way 1
% way 2



%{
%% chromesome polling standard
%find the measure in same Eigenvalues
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
%}

%{ 
%% ref about important variable
chome = populationSize
block  == bar = Denominator
beat  Numerator
note  4 = base 1/16 unit of note leangth

midiInfoStruct.Measure(mLtemp).noteContent(mcount,:) 
midiInfoStruct.Measure(mLtemp).beat(bLtemp).noteContent(bcount,:) 
midiInfoStruct.Measure(mLtemp).beat(bLtemp).note(nLtemp).noteContent(ncount,:) 

%}

 %{
    chromesome structure design like :
          layer1               layer2             layer3           layer4            layer5
      chromesome     measure        ::notedata::
                                                     beatNote      ::notedata::
                                                                             note           ::notedata::
                                                   otherCalInfo.... 
                                                                       otherCalInfo.....
                                                                                              otherCalInfo.... 
 ::notedata:: variable is NotesInfo             
 %}


%gaDat.Chrom=AdjustMeasureLength(gaDat);

%{
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
%}