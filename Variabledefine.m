function chordImportInfo=Variabledefine(chordImportInfo,rhythmNum)
%the data added to every variable
chordImport = RhythmImport(chordImportInfo(rhythmNum));
chordImportInfo(rhythmNum).tempo = chordImport.tempo;
chordImportInfo(rhythmNum).ticksPerQuarterNote = chordImport.ticksPerQuarterNote;
%chordImportInfo(rhythmNum).tonal = chordImport.cosTonal;
chordImportInfo(rhythmNum).midiMsgData = chordImport.midiMsgData;
chordImportInfo(rhythmNum).midiNote = chordImport.midiNote;
chordImportInfo(rhythmNum).timeSignatureNumerator = chordImport.timeSignatureNumerator;
chordImportInfo(rhythmNum).timeSignatureDenominator = chordImport.timeSignatureDenominator;
chordImportInfo(rhythmNum).stementLength = chordImport.stementLength;
chordImportInfo(rhythmNum).meausreLength = chordImport.meausreLength;
chordImportInfo(rhythmNum).notesInTheMeasure = chordImport.notesInTheMeasure;
chordImportInfo(rhythmNum).cosTonal(1,1)=1;
chordImportInfo(rhythmNum).cosTonal(1,2)=1;