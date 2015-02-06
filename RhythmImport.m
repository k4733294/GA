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
  if strcmp(a, 'default3.mid')
  b = size(midiInfoStruct.tonal);
  isfield(midiInfoStruct,'tonal')
  tmp2 = [0;0];
  isequal(midiInfoStruct.tonal,tmp2)
  pause
  end
%}

forcecosDeNu = midiInfoStruct.forcecosDeNu;
if forcecosDeNu == 1;
      midiInfoStruct.timeSignatureDenominator =midiInfoStruct.cosDenominator;
      midiInfoStruct.timeSignatureNumerator = midiInfoStruct.cosNumerator;
      disp('mom im here!! midiInfoStruct.forcecosDeNu == true' );
else
    if isfield(midiInfoStruct,'timeSignatureDenominator') == 1 || isfield(midiInfoStruct,'timeSignatureNumerator') == 1
         %% ////find info at first track
        % midiInfoStruct = midiMsg(midi,1,whichTrack,0,midiInfoStruct);
        disp('timeSignatureDenominator timeSignatureNumerator have one is 0   use costom value as sample import leak info')
        disp('rhthm import leak timeSignatureDenominator timeSignatureNumerator')
        disp('sample name')
        disp(midiInfoStruct.midiString) 
        %pause
        %////add custom info to sample
        midiInfoStruct.timeSignatureDenominator =midiInfoStruct.cosDenominator;
        midiInfoStruct.timeSignatureNumerator = midiInfoStruct.cosNumerator;
    end
end

%% ///////adjust if the tonal is not exist in sample///////
%user can perform a custom variable here    
%priority:
%1: in sample  (tonal not 0 ,  give a error dection)
%2: in user insert
tmp = [];
tmp2 = [0;0];

forcecosTonal = midiInfoStruct.forcecosTonal ;
if forcecosTonal == 1
    midiInfoStruct.tonal(1,1) =midiInfoStruct.cosTonal(1,1);
    midiInfoStruct.tonal(2,1) = midiInfoStruct.cosTonal(2,1);
    disp('mom im here!! midiInfoStruct.forcecosTonal == true' );
else
    if isfield(midiInfoStruct,'tonal') ~= 1 || isequal(midiInfoStruct.tonal,tmp)==1 || isequal(midiInfoStruct.tonal,tmp2)==1
        disp('tonal slot have one is 0 ')
        disp('use costom value as sample import leak info')
        disp('rhthm import 14 leak midiInfoStruct.tonal 1 2 ')
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
        %pause
        %////add custom info to sample
        midiInfoStruct.tonal(1,1) =midiInfoStruct.cosTonal(1,1);
        midiInfoStruct.tonal(2,1) = midiInfoStruct.cosTonal(2,1);
    end
end
%% KNOW which contain of Number of Measure do you want
midiInfoStruct = Numofmeasure(midiInfoStruct);

%% get the content of which note we want here
% transport the tonal to same as main melody
midiInfoStruct = Getmeasurecontent(midiInfoStruct);









