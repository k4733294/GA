function gaDat = DefaultImport(gaDat)

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
%/////all variable must exist
%{
rhythmNum = 1;
defaultImportInfo(rhythmNum).Objfun='defaultMelody';
defaultImportInfo(rhythmNum).midiString = 'default1.mid';
defaultImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
defaultImportInfo(rhythmNum).track=1;
defaultImportInfo(rhythmNum).howManyMeasureWeWant=1;
defaultImportInfo(rhythmNum).whichMeasureWeStart=1;
defaultImportInfo(rhythmNum).rhythm=rhythmNum;
defaultImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
defaultImportInfo(rhythmNum).cosDenominator=4;
defaultImportInfo(rhythmNum).cosNumerator=4;
defaultImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
defaultImportInfo(rhythmNum).cosTonal(1,1)=1;
defaultImportInfo(rhythmNum).cosTonal(2,1)=1;
version = 'default1_Output';
defaultImportInfo(rhythmNum).exportVersion=version;
defaultImportInfo = Variabledefine(defaultImportInfo,rhythmNum);
Melodyexport(defaultImportInfo(rhythmNum),version);
%}

%}
%{
rhythmNum = 2;
defaultImportInfo(rhythmNum).Objfun='defaultMelody';
defaultImportInfo(rhythmNum).midiString = 'default2.mid';
defaultImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
defaultImportInfo(rhythmNum).track=1;
defaultImportInfo(rhythmNum).howManyMeasureWeWant=1;
defaultImportInfo(rhythmNum).whichMeasureWeStart=1;
defaultImportInfo(rhythmNum).rhythm=rhythmNum;
defaultImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
defaultImportInfo(rhythmNum).cosDenominator=4;
defaultImportInfo(rhythmNum).cosNumerator=4;
defaultImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
defaultImportInfo(rhythmNum).cosTonal(1,1)=1;
defaultImportInfo(rhythmNum).cosTonal(2,1)=1;
version = 'default2_Output';
defaultImportInfo(rhythmNum).exportVersion=version;
defaultImportInfo = Variabledefine(defaultImportInfo,rhythmNum);
Melodyexport(defaultImportInfo(rhythmNum),version);
%}
%{
rhythmNum = 3;
defaultImportInfo(rhythmNum).Objfun='defaultMelody';
defaultImportInfo(rhythmNum).midiString = 'default3.mid';
defaultImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
defaultImportInfo(rhythmNum).track=1;
defaultImportInfo(rhythmNum).howManyMeasureWeWant=16;
defaultImportInfo(rhythmNum).whichMeasureWeStart=1;
defaultImportInfo(rhythmNum).rhythm=rhythmNum;
defaultImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
defaultImportInfo(rhythmNum).cosDenominator=4;
defaultImportInfo(rhythmNum).cosNumerator=4;
defaultImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
defaultImportInfo(rhythmNum).cosTonal(1,1)=1;
defaultImportInfo(rhythmNum).cosTonal(2,1)=1;
version = 'default3_Output';
defaultImportInfo(rhythmNum).exportVersion=version;
defaultImportInfo = Variabledefine(defaultImportInfo,rhythmNum);
Melodyexport(defaultImportInfo(rhythmNum),version);
%}
%{
rhythmNum = 4;
defaultImportInfo(rhythmNum).Objfun='defaultMelody';
defaultImportInfo(rhythmNum).midiString = 'default4.mid';
defaultImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
defaultImportInfo(rhythmNum).track=1;
defaultImportInfo(rhythmNum).howManyMeasureWeWant=5;
defaultImportInfo(rhythmNum).whichMeasureWeStart=1;
defaultImportInfo(rhythmNum).rhythm=rhythmNum;
defaultImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
defaultImportInfo(rhythmNum).cosDenominator=4;
defaultImportInfo(rhythmNum).cosNumerator=4;
defaultImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
defaultImportInfo(rhythmNum).cosTonal(1,1)=1;
defaultImportInfo(rhythmNum).cosTonal(2,1)=1;
version = 'default4_Output';
defaultImportInfo(rhythmNum).exportVersion=version;
defaultImportInfo = Variabledefine(defaultImportInfo,rhythmNum);
Melodyexport(defaultImportInfo(rhythmNum),version);
%}
%{
rhythmNum = 5;
defaultImportInfo(rhythmNum).Objfun='defaultMelody';
defaultImportInfo(rhythmNum).midiString = 'default5.mid';
defaultImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
defaultImportInfo(rhythmNum).track=1;
defaultImportInfo(rhythmNum).howManyMeasureWeWant=16;
defaultImportInfo(rhythmNum).whichMeasureWeStart=1;
defaultImportInfo(rhythmNum).rhythm=rhythmNum;
defaultImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
defaultImportInfo(rhythmNum).cosDenominator=4;
defaultImportInfo(rhythmNum).cosNumerator=4;
defaultImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
defaultImportInfo(rhythmNum).cosTonal(1,1)=1;
defaultImportInfo(rhythmNum).cosTonal(2,1)=1;
version = 'default5_Output';
defaultImportInfo(rhythmNum).exportVersion=version;
defaultImportInfo = Variabledefine(defaultImportInfo,rhythmNum);
Melodyexport(defaultImportInfo(rhythmNum),version);
%}
%{
rhythmNum = 6;
defaultImportInfo(rhythmNum).Objfun='defaultMelody';
defaultImportInfo(rhythmNum).midiString = 'default6.mid';
defaultImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
defaultImportInfo(rhythmNum).track=1;
defaultImportInfo(rhythmNum).howManyMeasureWeWant=16;
defaultImportInfo(rhythmNum).whichMeasureWeStart=1;
defaultImportInfo(rhythmNum).rhythm=rhythmNum;
defaultImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
defaultImportInfo(rhythmNum).cosDenominator=4;
defaultImportInfo(rhythmNum).cosNumerator=4;
defaultImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
defaultImportInfo(rhythmNum).cosTonal(1,1)=1;
defaultImportInfo(rhythmNum).cosTonal(2,1)=1;
version = 'default6_Output';
defaultImportInfo(rhythmNum).exportVersion=version;
defaultImportInfo = Variabledefine(defaultImportInfo,rhythmNum);
Melodyexport(defaultImportInfo(rhythmNum),version);
%}
%{
rhythmNum = 7;
defaultImportInfo(rhythmNum).Objfun='defaultMelody';
defaultImportInfo(rhythmNum).midiString = 'default7.mid';
defaultImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
defaultImportInfo(rhythmNum).track=1;
defaultImportInfo(rhythmNum).howManyMeasureWeWant=16;
defaultImportInfo(rhythmNum).whichMeasureWeStart=1;
defaultImportInfo(rhythmNum).rhythm=rhythmNum;
defaultImportInfo(rhythmNum).forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
defaultImportInfo(rhythmNum).cosDenominator=4;
defaultImportInfo(rhythmNum).cosNumerator=4;
defaultImportInfo(rhythmNum).forcecosTonal = 1; %%force use the cosTonal 1 = true
defaultImportInfo(rhythmNum).cosTonal(1,1)=1;
defaultImportInfo(rhythmNum).cosTonal(2,1)=1;
version = 'default7_Output';
defaultImportInfo(rhythmNum).exportVersion=version;
defaultImportInfo = Variabledefine(defaultImportInfo,rhythmNum);
Melodyexport(defaultImportInfo(rhythmNum),version);
%}

%if the chordmesurelenth is not fit with mainmesurelengh , we need to
%fitness the chordmeasurelength to main....
%ATTATION!!!! I have not done this funtion yet.
%{
if defaultImportInfo.notesInTheMeasure(1,3)~=gaDat.mainImportInfo.notesInTheMeasure(1,3)
    gaDat=Transportmeasure(gaDat);
    defaultImportInfo.sameTonalasMainMelody = 0;
else
    defaultImportInfo.notesInTheMeasure(:,9)=0;
    defaultImportInfo.notesInTheMeasure(:,10)=0;
    defaultImportInfo.sameTonalasMainMelody = 1;
end
%}
gaDat.defaultImportInfo=defaultImportInfo;