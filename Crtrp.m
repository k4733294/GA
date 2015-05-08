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
%% Change chordImportInfo tonal here
   load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDatRollingInTheDeepNoStructFixAllnote.mat');
   gaDat = ChangeImportTonal(gaDat); %important  must active
%% translate notetable from noteimport to chromesome bar beat note layer struct
   gaDat = StructNoteTable(gaDat); %important  must active
%% CreateEmptyChromsome
   gaDat = CreateEmptyChromsome(gaDat);
 % got main tonal 
    mainTonal = gaDat.mainImportInfo.tonal;
%% important loop info   to count every num measure beat we have
    mainMeasureNumProperty = getMainMeasureNumProperty(gaDat);
%% loop the measure length choice the " bar " first 
%   got ref from  mainimportinfo.measure.beat
populationSize = gaDat.populationSize;
for populationPosition = 1 : populationSize
    %%  create SFC chordLength numMainMeasure(for pMeasure)
        sampleFrameChoice = SFCmix(gaDat,mainMeasureNumProperty);
        chordLength = sampleFrameChoice.chordLength;
        numMainMeasure = mainMeasureNumProperty.totalNumMainMeasure;
    %%  evaluate priority of notes in Main Chord
        mainNotesRank = NotePriorityMatrix(gaDat,chordLength);
    %% SFC noteRank
    % Ranking Notes In Bar
        sfcNotesRank = SFCNotesRankCreate(sampleFrameChoice,numMainMeasure,chordLength,gaDat);
    %% 
    for pMeasure = 1 : numMainMeasure
        numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
        for pBeat  = 1 : chordLength : numMainMeasureBeat %%"cL" for step with sample chord length
        %% evaluate priority of notes in bar
            notePriorityInBeat = ChooseNotesPriorityInBeat(mainNotesRank,pMeasure,pBeat);
        %% adjust the chord by high priority notes in bar
            sampleFrameChoice = SampleFrameChoiceTranslate(sampleFrameChoice,pMeasure,pBeat,mainTonal,notePriorityInBeat,chordLength);
        end
        %% sampleFrameChoice fully restrut
            sampleFrameChoice = SFCRestruct(sampleFrameChoice);
        %% added to chromesome at struct of mesure bar note(mbn)
            gaDat = AddtoChromesome(gaDat,populationPosition,pMeasure,sampleFrameChoice);
    end
end
ChromsomeExport(gaDat);
%{
    %% loop detail:
    bar is loop unit
    4/4 got 4 bar in measure 
%}
%% 
%{
    diff file
     save('/Users/hooshuu/Documents/MATLAB/GA/struct_data/SFCBefore','sampleFrameChoice','-v7.3');
   save('/Users/hooshuu/Documents/MATLAB/GA/struct_data/SFCAfter','sampleFrameChoice','-v7.3');
    visdiff('/Users/hooshuu/Documents/MATLAB/GA/struct_data/SFCBefore.mat', '/Users/hooshuu/Documents/MATLAB/GA/struct_data/SFCAfter.mat');
%}
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