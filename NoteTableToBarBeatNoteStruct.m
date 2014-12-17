function midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct)
 %{
    structure design like :
          layer1               layer2             layer3           layer4            layer5
    midiInfoStruct     measure        ::notedata::
                                                     beatNote      ::notedata::
                                                                             note           ::notedata::
                                                   otherCalInfo.... 
                                                                       otherCalInfo.....
                                                                                              otherCalInfo.... 
 ::notedata:: variable is NotesInfo                    
 %}

measureLength = midiInfoStruct.timeSignatureDenominator ;
barLength = midiInfoStruct.timeSignatureNumerator;
noteLength = 4;

 mLtemp = 1;
 bLtemp = 1;
 nLtemp = 1;
 
 mcount = 1;
 bcount = 1;
 ncount = 1;
 
 nL = noteLength;
 bLnL = barLength*noteLength;
 mLbL = measureLength*bLnL;
 
 endOfNITM = size(midiInfoStruct.notesInTheMeasure,1);    
 a=zeros(100,10);
 
for i = 1: endOfNITM
    
    midiInfoStruct.Measure(mLtemp).noteContent(mcount,:) = midiInfoStruct.notesInTheMeasure(i,:);
    midiInfoStruct.Measure(mLtemp).beat(bLtemp).noteContent(bcount,:) = midiInfoStruct.notesInTheMeasure(i,:);
    midiInfoStruct.Measure(mLtemp).beat(bLtemp).note(nLtemp).noteContent(ncount,:) = midiInfoStruct.notesInTheMeasure(i,:);
    
    ncount = ncount + 1;
    bcount = bcount + 1;
    mcount = mcount + 1;

     ncountEnd = mod(midiInfoStruct.notesInTheMeasure(i,1),nL);
     
     if ncountEnd ~= 0
     else
         ncount = 1;
         nLtemp = nLtemp + 1;
     end
      bcountEnd = mod(midiInfoStruct.notesInTheMeasure(i,1),bLnL);
     if bcountEnd ~= 0
     else
         bcount = 1;
         bLtemp = bLtemp + 1;
     end
     mcountEnd = mod(midiInfoStruct.notesInTheMeasure(i,1),mLbL);
     if mcountEnd ~= 0
     else
         mcount =1;
         mLtemp = mLtemp + 1;
     end
  
     if nLtemp <= noteLength
     else
         nLtemp = 1;
     end
      
     if bLtemp <= barLength
     else
         bLtemp = 1;
     end

     if mLtemp <= measureLength
     else
         mLtemp = 1;
     end
 a(i,1)=mLtemp;
  a(i,2)= bLtemp;
  a(i,3)=nLtemp;
a
end
b=1;
 
 
 
 %{
chome = populationSize
block  == bar = Denominator = measure
beat  Numerator
note  4 = base 1/16 unit of note leangth


gaDat.populationSize
%}
 
 