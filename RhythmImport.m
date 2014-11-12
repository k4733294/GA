function midiInfoStruct = RhythmImport(midiInfoStruct)
midi = readmidi(midiInfoStruct.midiString);
%midi = readmidi('/Users/hooshuu/Music/Logic/test1.mid');
%midi = readmidi('/Users/hooshuu/Documents/MATLAB/GA/matlab-midi/tests/midi/testout.mid');

%midiInfoStruct.Objfun='rhythm';
%midiInfoStruct.rhythm=1;
%--------------------------------------------------------------------------------------------------------------------------------------------
%WARNING it is not all track in some MIDI PROJECT existing  numerator & denominator 
%GIVE a if else to make a situation without both of two variable have a...
%chanece to find the info from another track
whichTrack=midiInfoStruct.track;
midiInfoStruct = midiMsg(midi,1,whichTrack,0,midiInfoStruct);
if isfield(midiInfoStruct,'timeSignatureDenominator')
    %donothing
else
    midiInfoStruct = midiMsg(midi,1,1,0,midiInfoStruct);
    midiInfoStruct = midiMsg(midi,1,whichTrack,0,midiInfoStruct);
end
%--------------------------------------------------------------------------------------------------------------------------------------------
%KNOW which Number of Measure do you want and contain in it 
midiInfoStruct=Numofmeasure(midiInfoStruct);


function midiInfoStruct=Numofmeasure(midiInfoStruct)
%%
%% one measure length ppqn*BeatsPerMeasure;
%     structure ppqn*tsNumerator*(4/tsDenominator)   
%     like    2/4   = ppqn* 4 * [4/2]  4/2 is based from quartornote
disp(midiInfoStruct.midiString)
size(midiInfoStruct.timeSignatureDenominator)
size(midiInfoStruct.ticksPerQuarterNote)
size(midiInfoStruct.timeSignatureNumerator)
midiInfoStruct.stementLength = midiInfoStruct.ticksPerQuarterNote*midiInfoStruct.timeSignatureNumerator*(4/midiInfoStruct.timeSignatureDenominator);
midiInfoStruct.meausreLength = midiInfoStruct.ticksPerQuarterNote*(4/midiInfoStruct.timeSignatureDenominator);
pause
%% --------------------------------------------------------------------------------------------------------
%sum delta time and add variable in midiInfoStruct
%add tempCalMatrix to midiInfoStruct.deltaMsgMatrix

%midiInfoStruct.totalDeltalTime = sum(midiInfoStruct.midiMsgData(:,1));

%% get the content of which note we want here
midiInfoStruct = Getmeasurecontent(midiInfoStruct);
%% transport the tonal to same as main melody

a=0;

