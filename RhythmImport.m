function midiInfoStruct = RhythmImport(midiInfoStruct)
midi = readmidi(midiInfoStruct.midiString);
whichTrack=midiInfoStruct.track;
midiInfoStruct = midiMsg(midi,1,1,0,midiInfoStruct);
midiInfoStruct = midiMsg(midi,1,whichTrack,0,midiInfoStruct);
%--------------------------------------------------------------------------------------------------------------------------------------------
%% ///////adjust if the numerator & denominator is not exist in sample///////
%user can perform a custom variable here    
%priority:
%1: in sample  (numerator & denominator not 0 ,  give a error dection)
%2: in user insert
%{
  a = midiInfoStruct.midiString;
  if strcmp(a, 'tiesto-wasted_ft_matthew_koma.midi')
  b= size(midiInfoStruct.tonal)
  isfield(midiInfoStruct,'tonal')
  tmp2 = [0;0];
  isequal(midiInfoStruct.tonal,tmp2)
  pause
  end
%}
if isfield(midiInfoStruct,'timeSignatureDenominator') ==1 && isfield(midiInfoStruct,'timeSignatureNumerator') == 1
else
    %% ////find info at first track
    % midiInfoStruct = midiMsg(midi,1,whichTrack,0,midiInfoStruct);
    disp('timeSignatureDenominator timeSignatureNumerator have one is 0   use costom value as sample import leak info')
    disp('rhthm import 14 leak timeSignatureDenominator timeSignatureNumerator')
    disp('sample name')
    disp(midiInfoStruct.midiString) 
    pause
    %////add custom info to sample
    midiInfoStruct.timeSignatureDenominator =midiInfoStruct.cosDenominator;
    midiInfoStruct.timeSignatureNumerator = midiInfoStruct.cosNumerator;
    
end

%{
if isfield(midiInfoStruct,'timeSignatureDenominator')
    %donothing
else
    midiInfoStruct = midiMsg(midi,1,1,0,midiInfoStruct);
    midiInfoStruct = midiMsg(midi,1,whichTrack,0,midiInfoStruct);
end
%}
%% ///////adjust if the tonal is not exist in sample///////
%user can perform a custom variable here    
%priority:
%1: in sample  (tonal not 0 ,  give a error dection)
%2: in user insert
tmp = [];
tmp2 = [0;0];
if isfield(midiInfoStruct,'tonal') ~= 1 || isequal(midiInfoStruct.tonal,tmp)==1 || isequal(midiInfoStruct.tonal,tmp2)==1
     disp('timeSignatureDenominator timeSignatureNumerator have one is 0 ')
    disp('use costom value as sample import leak info')
    disp('rhthm import 14 leak timeSignatureDenominator timeSignatureNumerator')
    disp('sample name')
    disp(midiInfoStruct.midiString)
    %{
    disp(' size of tonal valune')
    size(midiInfoStruct.tonal(1))
    disp(' size of minor or major /  1 or 0')
    size(midiInfoStruct.tonal(2))

  a = midiInfoStruct.midiString;
  if strcmp(a, 'feel-so-close.mid')
  b= size(midiInfoStruct.tonal)
  pause
  end
  
    %}
    pause
    %////add custom info to sample
    midiInfoStruct.tonal(1,1) =midiInfoStruct.cosTonal(1,1);
    midiInfoStruct.tonal(2,1) = midiInfoStruct.cosTonal(2,1);
else
end
%% KNOW which contain of Number of Measure do you want
midiInfoStruct=Numofmeasure(midiInfoStruct);


function midiInfoStruct=Numofmeasure(midiInfoStruct)

%% one measure length ppqn*BeatsPerMeasure;
%     structure ppqn*tsNumerator*(4/tsDenominator)   
%     like    2/4   = ppqn* 4 * [4/2]  4/2 is based from quartornote
midiInfoStruct.stementLength = midiInfoStruct.ticksPerQuarterNote*midiInfoStruct.timeSignatureNumerator*(4/midiInfoStruct.timeSignatureDenominator);
midiInfoStruct.meausreLength = midiInfoStruct.ticksPerQuarterNote*(4/midiInfoStruct.timeSignatureDenominator);
%% --------------------------------------------------------------------------------------------------------
%sum delta time and add variable in midiInfoStruct
%add tempCalMatrix to midiInfoStruct.deltaMsgMatrix
%midiInfoStruct.totalDeltalTime = sum(midiInfoStruct.midiMsgData(:,1));


%% get the content of which note we want here
midiInfoStruct = Getmeasurecontent(midiInfoStruct);
%% transport the tonal to same as main melody

a=0;

