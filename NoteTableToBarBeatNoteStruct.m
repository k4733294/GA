function midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct)


measureLength = midiInfoStruct.timeSignatureDenominator ;
barLength = midiInfoStruct.timeSignatureNumerator;
noteLength = 4;

 endOfNITM = size(mainImportInfo.notesInTheMeasure,1);
 mLtemp = 1;
 bLtemp = 1;
 nLtmep = 1;
 %{
    structure design like :
          layer1               layer2             layer3           layer4            layer5
    mainImportInfo     measure        ::notedata::
                                                     beatNote      ::notedata::
                                                                             note           ::notedata::
                                                   otherCalInfo.... 
                                                                       otherCalInfo.....
                                                                                              otherCalInfo.... 
 ::notedata:: variable is NotesInfo
                                                                                            
                            
 %}
        
 
for i = 1: endOfNITM
    
    mainImportInfo.notesInTheMeasure
    
    mainImportInfo.Measure(mLtemp).beat(bLtemp).note(nLtmep) = mainImportInfo.notesInTheMeasure(i,:);
    
end
 
 
 
 %{
chome = populationSize
block  == bar = Denominator = measure
beat  Numerator
note  4 = base 1/16 unit of note leangth


gaDat.populationSize
%}
 
 