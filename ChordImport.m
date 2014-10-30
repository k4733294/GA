function gaDat = ChordImport(gaDat)
%{
define the datastructure
    noteNum     type      tonal   octave      notePitch   (EXTENed)  rhythm
     0                 chord    domi      +1...         60C                                 1  
     1                  note    subdm     0              62D                                 2
     2..                            minor..   -1..           64E..                                3..

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
%how many sample we have
rhythmNumTotal = 1;


%import which track in midi file wewant
rhythmNum=1;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = '/Users/hooshuu/Music/midi/pitbull-timber_ft_kesha.mid';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=11;
chordImportInfo(rhythmNum).howManyMeasureWeWant=2;
chordImportInfo(rhythmNum).whichMeasureWeStart=2;
chordImportInfo(rhythmNum).rhythm=rhythmNum;

rhythmNum=2;
chordImportInfo(rhythmNum).Objfun='chordMelody';
chordImportInfo(rhythmNum).midiString = '/Users/hooshuu/Music/midi/calvin_harris-summer.mid';
chordImportInfo(rhythmNum).mainOrChord=1; % 0 = main melody 1=import chord melody
chordImportInfo(rhythmNum).track=11;
chordImportInfo(rhythmNum).howManyMeasureWeWant=2;
chordImportInfo(rhythmNum).whichMeasureWeStart=2;
chordImportInfo(rhythmNum).rhythm=rhythmNum;

%the data added to every variable
for i = 1 : rhythmNumTotal
chordImportInfo = Variabledefine(chordImportInfo,rhythmNum);
end
gaDat.chordImportInfoRhythmNum=rhythmNumTotal;

%if the chordmesurelenth is not fit with mainmesurelengh , we need to
%fitness the chordmeasurelength to main....
%ATTATION!!!! I have not done this funtion yet.
%{
if chordImportInfo.notesInTheMeasure(1,3)~=gaDat.mainImportInfo.notesInTheMeasure(1,3)
    gaDat=Transportmeasure(gaDat);
    chordImportInfo.sameTonalasMainMelody = 0;
else
    chordImportInfo.notesInTheMeasure(:,9)=0;
    chordImportInfo.notesInTheMeasure(:,10)=0;
    chordImportInfo.sameTonalasMainMelody = 1;
end
%}

gaDat.chordImportInfo=chordImportInfo;


%chordImportInfo = GanerateChrom(chordImportInfo);
%must output the result here;


   

function chordImportInfo = GanerateChrom(chordImportInfo)
for i = 1 :pSize
  tonalVariableContant =Tonalgenerate(tempBarNum,majorNote);
  melodyProgressContant = Melodygenerate(tonalVariableContant,tempBarNum,tempBarSize); 
  tempChrom(:,i)=melodyProgressContant;
end











    





































  


