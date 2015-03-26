function gaDat = Crtrp(gaDat)
%% view the every clip sample output  mainmelo & chord import
%{
for i = 1 : 6
    a = 'title';
    if i <=5
        a = strcat(gaDat.chordimportinfo(i).exportVersion,'.mid');
       
        midi = readmidi(a);
    else
        a = strcat(gaDat.mainimportinfo.exportVersion,'.mid');
        midi = readmidi(a);
    end
Notes = midiinfo(midi,0);
[PR,t,nn] = piano_roll(Notes,1);
figure;
imagesc(t,nn,PR);
title(a);
axis xy;
xlabel('time (sec)');
ylabel('note number');
   
end
%}
%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDat.mat'); %important  must active
%% Change chordImportInfo tonal here
%gaDat = ChangeImportTonal(gaDat); %important  must active
%% translate notetable from noteimport to chromesome bar beat note layer struct
%gaDat = StructNoteTable(gaDat); %important  must active
load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDat_fixedTonal.mat');
%% CreateEmptyChromsome
gaDat = CreateEmptyChromsome(gaDat);
%% Ranking Notes In Bar
%   evaluate priority of notes
mainNotesRank = RankingNotes(gaDat);
 % got main tonal 
mainTonal = gaDat.mainImportInfo.tonal;
%% loop detail:
%{
    bar is loop unit
    4/4 got 4 bar in measure 
    ***we think about every  1 3 bar in measure have chance to rand  
%}
%% loop the measure length choice the " bar " first 
%   got ref from  mainimportinfo.measure.beat
pS = gaDat.populationSize;
for pPopulationSize = 1:pS
    numMainMeasure = size(gaDat.mainImportInfo.measure,2);
    %% rand choicing sample from importsamplebeat or defaultsamplebeat
    %   setting probability   importsamplebeat 20%  defautsamplebeat 80%
    samplePropertiesChoice = getRandSampleProperties();
    %% sample choiced
    %   choice which frame in that properties we want
    sampleNumChoice = SPC(gaDat,samplePropertiesChoice);
    for pMeasure = 1 : numMainMeasure
        numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
        %% choice Data Actually from 
        sampleFrameChoice = SBC(gaDat,pMeasure,sampleNumChoice,samplePropertiesChoice);
        cL = sampleFrameChoice.chordLength;
        for pBeat  = 1 :cL:numMainMeasureBeat %%"cL" for step with sample chord length
        %% evaluate priority of notes in bar
            notePriorityInBeat = ChooseNotesPriorityInBeat(mainNotesRank,pMeasure,pBeat);
        %% adjust the chord by high priority notes in bar
            sampleFrameChoice = SampleFrameChoiceTranslate(sampleFrameChoice,pBeat,mainTonal,notePriorityInBeat);
        %% added to chromesome at struct of mesure bar note(mbn)
            gaDat = AddtoChromesome(gaDat,pPopulationSize,pMeasure,pBeat,sampleFrameChoice);
        end
    end
end
%% 
%{
%get measure nums
size(gaDat.mainimportinfo.measure,2)
%get measure noteContent total nums
size(gaDat.mainimportinfo.measure.noteContent,1)
%get beat in measure nums
size(gaDat.mainimportinfo.measure.beat,2)
%get beat noteContent total nums
size(gaDat.mainimportinfo.measure.beat(1,1).noteContent,1)
%get note in beat in measure nums
size(gaDat.mainimportinfo.measure.beat(1,1).note,2)
%get note noteContent total nums
size(gaDat.mainimportinfo.measure.beat(1,1).note(1,1).noteContent,1)
%}
%{
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
%}
%{ 
%% ref about important variable
chome = populationSize
block  == bar = Denominator
beat  Numerator
note  4 = base 1/16 unit of note leangth

midiinfoStruct.Measure(mLtemp).noteContent(mcount,:) 
midiinfoStruct.Measure(mLtemp).beat(bLtemp).noteContent(bcount,:) 
midiinfoStruct.Measure(mLtemp).beat(bLtemp).note(nLtemp).noteContent(ncount,:) 

%}
%{
    chromesome structure design like :
          layer1               layer2             layer3           layer4            layer5
      chromesome     measure        ::notedata::
                                                     beatNote      ::notedata::
                                                                             note           ::notedata::
                                                   otherCalinfo.... 
                                                                       otherCalinfo.....
                                                                                              otherCalinfo.... 
 ::notedata:: variable is Notesinfo             
%}
%{
function Chrom=AdjustMeasureLength(gaDat)

number=gaDat.populationSize;
rhythmNumber = gaDat.chordimportinfoRhythmNum;
mNiTMs=size(gaDat.mainimportinfo.notesinTheMeasure,1);
cNiTMs=size(gaDat.chordimportinfo(rhythmNumber).notesinTheMeasure,1);

for i = 1 : number
count=1;
    if cNiTMs>mNiTMs
          Chrom(number).chromNotes(1:mNiTMs,:) = gaDat.chordimportinfo(rhythmNumber).notesinTheMeasure(1:mNiTMs,:);
    elseif cNiTMs<mNiTMs
        for i= 1 : mNiTMs
                Chrom(number).chromNotes(i,:) = gaDat.chordimportinfo(rhythmNumber).notesinTheMeasure(count,:);
                if count == cNiTMs
                    count=1;
                else
                    count=count+1;
                end
        end
    else
         Chrom(number).chromNotes= gaDat.chordimportinfo(rhythmNumber).notesinTheMeasure;
    end
end
%}