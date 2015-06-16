function midiInfoStruct = NoteTableToBarBeatNoteStruct(midiInfoStruct)
%%
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

%% prepare the every length infomation we need here
measureLength = midiInfoStruct.timeSignatureDenominator ;
barLength = midiInfoStruct.timeSignatureNumerator;
noteLength = 4;

mLtemp = 1;
bLtemp = 1;
%nLtemp = 1;

mcount = 1;
bcount = 1;
%ncount = 1;

m0sync = false;
b0sync = false;
%n0sync = false;

b0sameNum = 1;
m0sameNum = 1;
%n0sameNum = 1;

%{
  here is everything length using in counting total index from notemeasure
  we need loop from index.
%}
%nL = noteLength;
bL = barLength;
mLbL = measureLength*bL;

endOfNITM = size(midiInfoStruct.notesInTheMeasure,1);
for i = 1: endOfNITM
    %%   import notesInTheMeasure to chromesome struct
    midiInfoStruct.measure(mLtemp).noteContent(mcount,:) = midiInfoStruct.notesInTheMeasure(i,:);
    midiInfoStruct.measure(mLtemp).beat(bLtemp).noteContent(bcount,:) = midiInfoStruct.notesInTheMeasure(i,:);
    %midiInfoStruct.measure(mLtemp).beat(bLtemp).note(nLtemp).noteContent(ncount,:) = midiInfoStruct.notesInTheMeasure(i,:);
    %% we make loop implement here
    %{
     attention:
       we make x0sync to implement zero shift 1  like
       1 2 3   4      5
                false  true   :x0sync
                           1 2 3   4      5
                                    false  true
        making result correctly
    %}
    if i ~= endOfNITM
        preDectect = i+1;
    else
        preDectect = i;
    end
    
    mcountEnd = mod(midiInfoStruct.notesInTheMeasure(i,1),mLbL);
    if mcountEnd == 0
        if mcountEnd ~= mod(midiInfoStruct.notesInTheMeasure(preDectect,1),mLbL)
            m0sync = true ;
        else
            %if m0sameNum ~= midiInfoStruct.notesInTheMeasure(i,1)
            %end
        end
    else
    end
    if m0sync == true
        mcount =1;
        mLtemp = mLtemp + 1;
        m0sync = false;
        %m0sameNum = midiInfoStruct.notesInTheMeasure(i,1);
    else
        mcount = mcount + 1;
    end
    
    bcountEnd = mod(midiInfoStruct.notesInTheMeasure(i,1),bL);
    if bcountEnd == 0
        if bcountEnd ~= mod(midiInfoStruct.notesInTheMeasure(preDectect,1),bL)
            %if b0sameNum ~= midiInfoStruct.notesInTheMeasure(preDectect,1)
            b0sync = true ;
            %end
        end
    end
    if b0sync == true;
        bcount = 1;
        bLtemp = bLtemp + 1;
        b0sync = false;
        %b0sameNum = midiInfoStruct.notesInTheMeasure(preDectect,1);
    else
        bcount = bcount + 1;
    end
    
    %{
     ncountEnd = mod(midiInfoStruct.notesInTheMeasure(i,1),nL);
     if ncountEnd == 0
         if n0sameNum ~= midiInfoStruct.notesInTheMeasure(i,1)
         n0sync = true ;
         end
     elseif n0sync == true
          ncount = 1;
          nLtemp = nLtemp + 1;
          n0sync = false;
          n0sameNum = midiInfoStruct.notesInTheMeasure(i,1);
     else
     end
    %}
    %ncount = ncount + 1;
    %%  make Length in every part  must follow the sample info
    %{
     if mLtemp <= measureLength
     else
         mLtemp = 1;
     end
    %}
    if bLtemp <= barLength
    else
        bLtemp = 1;
    end
    
    %{
     if nLtemp <= noteLength
     else
         nLtemp = 1;
     end
    %}
end
%%
%{
ref variable
chome = populationSize
block  == bar = Denominator = measure
beat  Numerator
note  4 = base 1/16 unit of note leangth


gaDat.populationSize
%}
  %{
     if bcountEnd == 0
         if b0sameNum ~= midiInfoStruct.notesInTheMeasure(i,1)
            b0sync = true ;
         end
     elseif b0sync == true;
         bcount = 1;
         bLtemp = bLtemp + 1;
         b0sync = false;
         b0sameNum = midiInfoStruct.notesInTheMeasure(i,1);
     else
     end
     %}
     %{
     mcountEnd = mod(midiInfoStruct.notesInTheMeasure(i,1),mLbL);
     if mcountEnd == 0
         if m0sameNum ~= midiInfoStruct.notesInTheMeasure(i,1)
            m0sync = true ;
         end    
     elseif m0sync == true
         mcount =1;
         mLtemp = mLtemp + 1;
         m0sync = false;
         m0sameNum = midiInfoStruct.notesInTheMeasure(i,1);
     else
     end
     %}
 