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
