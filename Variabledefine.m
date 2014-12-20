function chordImportInfo=Variabledefine(chordImportInfo,rhythmNum)
%% the data added to every variable
chordImport = RhythmImport(chordImportInfo(rhythmNum));
%chordImportInfo(rhythmNum).tempo = chordImport.tempo;
%chordImportInfo(rhythmNum).ticksPerQuarterNote = chordImport.ticksPerQuarterNote;
%chordImportInfo(rhythmNum).midiMsgData = chordImport.midiMsgData;
%chordImportInfo(rhythmNum).midiNote = chordImport.midiNote;
chordImportInfo(rhythmNum).timeSignatureNumerator = chordImport.timeSignatureNumerator;
chordImportInfo(rhythmNum).timeSignatureDenominator = chordImport.timeSignatureDenominator;
chordImportInfo(rhythmNum).stementLength = chordImport.stementLength;
chordImportInfo(rhythmNum).meausreLength = chordImport.meausreLength;
chordImportInfo(rhythmNum).notesInTheMeasure = chordImport.notesInTheMeasure;
chordImportInfo(rhythmNum).tonal = chordImport.tonal;

%{
if rhythmNum ==5
a=1;
end
%}
