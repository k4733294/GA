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
%rhythmNum =1;
%gaDat.chordImportInfo(rhythmNum);
%deltaTimeSixteenthNote = gaDat.chordImportInfo(rhythmNum).ticksPerQuarterNote/4;
%measureLengthNoteNum=gaDat.chordImportInfo(rhythmNum).meausreLength/deltaTimeSixteenthNote;

%% Change sample tonal here
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
%% loop detail:
%{
    bar is loop unit
    4/4 got 4 bar in measure 
    we think about every  1 3 bar in measure have chance to rand
    
%}
%% loop the measure length choice the " bar " first 
%%got ref from  mainImportInfo.measure.beat
numMainMeasureBeat = size(gaDat.mainImportInfo.measure.beat,2);
%chromesome = numMainMeasureBeat
for i  = 1 : numMainMeasureBeat
%% rand choicing sample from importsamplebeat or defaultsamplebeat
%%setting probability   importsamplebeat 20%  defautsamplebeat 80%
samplePropertiesChoice = randi([1 100]);
    if samplePropertiesChoice > 20
        %%choice from defaultsample 
        samplePropertiesChoice = 1;
    else
        %%choice from importsample 
        samplePropertiesChoice = 0;
    end
%% sample choiced
%choice which frame in that properties we want    
    sampleNumChoice = SPC(gaDat,samplePropertiesChoice);
%choice Data Actually from 
    sampleFrameChoice = SBC(gaDat,i,sampleNumChoice);
%% evaluate priority of notes in bar
    notePriority = NotePriorityCal(gaDat,sampleNumChoice,sampleFrameChoice);
%% adjust the chord by high priority notes in bar
    sampleFrameChoice = SampleFrameChoiceTranslate(gaDat,i,sampleNumChoice,sampleFrameChoice,notePriority);
%% added to chromesome at struct of mesure bar note(mbn)
    gaDat = AddtoChomesome(gaDat,sampleFrameChoice);
%% adjust bar loop position

end
 
%% 
%{
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
%}
%% find something eiganvalue at diffrent length in notes
% eigan1
%calculate eigan1 in every measure
%calculate eigan1 in every beat
%calculate eigan1 in every note
% eigan2
%calculate eigan2 in every measure
%calculate eigan2 in every beat
%calculate eigan2 in every note
%% conclusion the eiganvalue ( for after instuction at sample edit? )
 % way1 true false
 % way2 true false
%% dicide the way to edit  sample to population here
% way 1
% way 2

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