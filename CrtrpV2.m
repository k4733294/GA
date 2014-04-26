function chrom= CrtrpV2(gaDat)
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
rhythmImport();
chrom = 0;

%{
for i = 1 :pSize
  tonalVariableContant =Tonalgenerate(tempBarNum,majorNote);
  melodyProgressContant = Melodygenerate(tonalVariableContant,tempBarNum,tempBarSize); 
  tempChrom(:,i)=melodyProgressContant;
end
%}

function rhythmImport()
midi = readmidi('/Users/hooshuu/Music/midi/pitbull-timber_ft_kesha.mid');
%midi = readmidi('/Users/hooshuu/Music/Logic/test1.mid');
%midi = readmidi('/Users/hooshuu/Documents/MATLAB/GA/matlab-midi/tests/midi/testout.mid');
midiInfoStruct.Objfun='rhythm';
midiInfoStruct.rhythm=1;
%--------------------------------------------------------------------------------------------------------------------------------------------
%WARNING it is not all track in some MIDI PROJECT existing  numerator & denominator 
%GIVE a if else to make a situation without both of two variable have a...
%chanece to find the info from another track
midiInfoStruct = midiMsg(midi,1,1,0,midiInfoStruct);
midiInfoStruct = midiMsg(midi,1,10,0,midiInfoStruct);
%--------------------------------------------------------------------------------------------------------------------------------------------
%KNOW which Number of Measure do you want and contain in it 
midiInfoStruct=Numofmeasure(midiInfoStruct);




function midiInfoStruct=Numofmeasure(midiInfoStruct)
%%
notesInTheMeasure = [];
%% one measure length ppqn*BeatsPerMeasure;
%     structure ppqn*tsDenominator*(4/tsNumerator)   
%     like    2/4   = ppqn* 4 * [4/2]  4/2 is based from quartornote
midiInfoStruct.measureLength = midiInfoStruct.ticksPerQuarterNote*midiInfoStruct.timeSignatureDenominator*(4/midiInfoStruct.timeSignatureNumerator);
whichLengthWeWant = 3; %default

%% --------------------------------------------------------------------------------------------------------
%sum delta time and add variable in midiInfoStruct
%add tempCalMatrix to midiInfoStruct.deltaMsgMatrix
midiInfoStruct.totalDeltalTime = sum(midiInfoStruct.midiMsgData(:,1));

%% get the content of which note we want here
notesInTheMeasure = Getmeasurecontent(whichLengthWeWant,midiInfoStruct);
%% transport the tonal to same as main melody
midiInfoStruct=Transportmeasure(notesInTheMeasure,midiInfoStruct);

function Transportmeasure(notesInTheMeasure,midiInfoStruct)
%notesInTheMeasure(i,3)  tonal 
%notesInTheMeasure(i,5) pitch

%tonal = notesInTheMeasure(i,3)2 ==




    





































  


