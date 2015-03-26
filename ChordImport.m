function gaDat = ChordImport(gaDat)
%{
define the datastructure
    noteNum     type      tonal   octave      notePitch   (EXTENed)  rhythm
     0                 chord    domi      +1...         60C                                 1  
     1                  note    subdm     0            62D                                 2
     2..                            minor..   -1..            64E..                                3..

initial step
    step   from the "rhythm import" or create by "gainit"
    step   decide      rhythm
    step   decide      tonal                        random tonal  
    step   decide      decide octave          random octave
    step   decide      pitch notetype         random pitch notetype
    step   loop and add the noteNum
%}

%tempBarSize=gaDat.barSize; pSize=gaDat.populationSize;
% majorNote = gaDat.majorNote; tempBarNum=gaDat.barNum;
 
%{
tempNIND is 320 in here  which is follwed by the lengh of "import melody"
tempFieldD is 500 by population size edit at chordexample

///output is initaial chromsome by some rules at below////
----------------------------------------------------
initial population rules 
 rule 1 : note length compare both of it , find the main note in  this bar
 rule 3 : at a range of +-2 scales 
 rule 4 : make some random tonal of the bar
 rule 5 : decide the rhythm import or created by initial in my strategy
 rule 6 : loop and add the count at the noteNum
%}

%% import which track in midi file wewant
%%{
%%/////all variable must exist
rhythmNum = 1;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = 'david_guetta-lovers_on_the_sun_feat_sam_martin.midi';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=3;
chordImportInfo(rhythmNum).howManyMeasureWeWant=15;
chordImportInfo(rhythmNum).whichMeasureWeStart=49;
chordImportInfo(rhythmNum).rhythm=rhythmNum;
chordImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
chordImportInfo(rhythmNum).cosDenominator=4;
chordImportInfo(rhythmNum).cosNumerator=4;
chordImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
chordImportInfo(rhythmNum).cosTonal(1,1)=5;    % B
chordImportInfo(rhythmNum).cosTonal(2,1)=1;    % minor
chordImportInfo(rhythmNum).chordLength=2;
version = 'davidguetta_Output';
chordImportInfo(rhythmNum).exportVersion=version;
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
Melodyexport(chordImportInfo(rhythmNum),version);
%}
%%{
rhythmNum = 2;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = 'feel-so-close.mid';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=1;
chordImportInfo(rhythmNum).howManyMeasureWeWant=18;
chordImportInfo(rhythmNum).whichMeasureWeStart=5;
chordImportInfo(rhythmNum).rhythm=rhythmNum;
chordImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
chordImportInfo(rhythmNum).cosDenominator=4;
chordImportInfo(rhythmNum).cosNumerator=4;
chordImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
chordImportInfo(rhythmNum).cosTonal(1,1)=1; %C
chordImportInfo(rhythmNum).cosTonal(2,1)=0; %Major
chordImportInfo(rhythmNum).chordLength=2;
version = 'feel so close_Output';
chordImportInfo(rhythmNum).exportVersion=version;
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
Melodyexport(chordImportInfo(rhythmNum),version);
%}
%%{
rhythmNum = 3;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = 'hardwell_Output.mid';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=1;
chordImportInfo(rhythmNum).howManyMeasureWeWant=15;
chordImportInfo(rhythmNum).whichMeasureWeStart=15;
chordImportInfo(rhythmNum).rhythm=rhythmNum;
chordImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
chordImportInfo(rhythmNum).cosDenominator=4;
chordImportInfo(rhythmNum).cosNumerator=4;
chordImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
chordImportInfo(rhythmNum).cosTonal(1,1)=-3;  %D#  Eb
chordImportInfo(rhythmNum).cosTonal(2,1)=1;    %minor
chordImportInfo(rhythmNum).chordLength=2;
version = 'hardwell_Output_test3';
chordImportInfo(rhythmNum).exportVersion=version;
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
Melodyexport(chordImportInfo(rhythmNum),version);
%}
%%{
rhythmNum = 4;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = 'aviciiLevelsMelody.mid';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=1;
chordImportInfo(rhythmNum).howManyMeasureWeWant=16;
chordImportInfo(rhythmNum).whichMeasureWeStart=11;
chordImportInfo(rhythmNum).rhythm=rhythmNum;
chordImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
chordImportInfo(rhythmNum).cosDenominator=4;
chordImportInfo(rhythmNum).cosNumerator=4;
chordImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
chordImportInfo(rhythmNum).cosTonal(1,1)=-3; %Eb
chordImportInfo(rhythmNum).cosTonal(2,1)=1; %minor
chordImportInfo(rhythmNum).chordLength=2;
version = 'AVICII LEVELS_Output';
chordImportInfo(rhythmNum).exportVersion=version;
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
Melodyexport(chordImportInfo(rhythmNum),version);
%}
%%{
%except added  have some error here so i try another way to import 
rhythmNum = 5;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = 'avicii-the_days_ft_robbie_williams.mid';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=7;
chordImportInfo(rhythmNum).howManyMeasureWeWant=16;
chordImportInfo(rhythmNum).whichMeasureWeStart=33;
chordImportInfo(rhythmNum).rhythm=rhythmNum;
chordImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
chordImportInfo(rhythmNum).cosDenominator=4;
chordImportInfo(rhythmNum).cosNumerator=4;
chordImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
chordImportInfo(rhythmNum).cosTonal(1,1)=1;%C
chordImportInfo(rhythmNum).cosTonal(2,1)=0;%major
chordImportInfo(rhythmNum).chordLength=2;
version = 'avicii-the_days_ft_robbie_williams_Output';
chordImportInfo(rhythmNum).exportVersion=version;
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
Melodyexport(chordImportInfo(rhythmNum),version);
%}
%%{
rhythmNum = 6;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = 'tiesto-wasted_ft_matthew_koma.midi';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=5;
chordImportInfo(rhythmNum).howManyMeasureWeWant=18;
chordImportInfo(rhythmNum).whichMeasureWeStart=55;
chordImportInfo(rhythmNum).rhythm=rhythmNum;
chordImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
chordImportInfo(rhythmNum).cosDenominator=4;
chordImportInfo(rhythmNum).cosNumerator=4;
chordImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
chordImportInfo(rhythmNum).cosTonal(1,1)=3;%D
chordImportInfo(rhythmNum).cosTonal(2,1)=0;%major
chordImportInfo(rhythmNum).chordLength=2;
version = 'tiesto-wasted_ft_matthew_koma_Output';
chordImportInfo(rhythmNum).exportVersion=version;
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
Melodyexport(chordImportInfo(rhythmNum),version);
%}
%%{
rhythmNum = 7;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = 'calvin_harris-summer_logicformat.mid';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=3;
chordImportInfo(rhythmNum).howManyMeasureWeWant=20;
chordImportInfo(rhythmNum).whichMeasureWeStart=12;
chordImportInfo(rhythmNum).rhythm=rhythmNum;
chordImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
chordImportInfo(rhythmNum).cosDenominator=4;
chordImportInfo(rhythmNum).cosNumerator=4;
chordImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
chordImportInfo(rhythmNum).cosTonal(1,1)=2;%G
chordImportInfo(rhythmNum).cosTonal(2,1)=0;%Major
chordImportInfo(rhythmNum).chordLength=2;
version = 'calvin harris_Output';
chordImportInfo(rhythmNum).exportVersion=version;
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
Melodyexport(chordImportInfo(rhythmNum),version);
%}
gaDat.chordImportInfo=chordImportInfo;













    





































  


