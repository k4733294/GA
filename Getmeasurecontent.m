function notesInTheMeasure = Getmeasurecontent(whichLengthWeWant,midiInfoStruct)
%%
startDeltaTime = (whichLengthWeWant-1)*midiInfoStruct.measureLength+midiInfoStruct.midiMsgData(1,1);
endDeltaTime = (whichLengthWeWant)*midiInfoStruct.measureLength+midiInfoStruct.midiMsgData(1,1);
deltaTimeQuarterNote = midiInfoStruct.ticksPerQuarterNote;
deltaTimeSixteenthNote = deltaTimeQuarterNote/4;
%% make the meaureLength to the parts of SixteenthNote in the notesInTheMeasure
measurelength= endDeltaTime - startDeltaTime;
numsMeasurePieceOfSixteenthNote = measurelength/deltaTimeSixteenthNote;
notesPitch = zeros(numsMeasurePieceOfSixteenthNote,1);
%% PREPARE to translate the delta time of note to chrom struct infomation
%----------------------------------------------------------------------------------------------------------------------------------------------
measureStartNote = find(midiInfoStruct.midiMsgData(:,1)<=startDeltaTime);
measureStartNote = max(measureStartNote);
measureEndNote = find(midiInfoStruct.midiMsgData(:,2)<=endDeltaTime);
measureEndNote = max(measureEndNote);


totalMeasureNote=(measureEndNote-measureStartNote+1)/2;
notesTimeMaping = zeros(numsMeasurePieceOfSixteenthNote,totalMeasureNote);
noteNumCount=1;
numOfFirstFromOne= midiInfoStruct.midiMsgData(measureStartNote,1)/deltaTimeSixteenthNote;

%% CREATE the table to know the time having more than one note 
%    next step is combine the data and give the the type define
for measureDirection = measureStartNote : measureEndNote
    noteDeltaLength = midiInfoStruct.midiMsgData(measureDirection,2) - midiInfoStruct.midiMsgData(measureDirection,1);
    numsSixteenthNote = noteDeltaLength/deltaTimeSixteenthNote;
   
    numOfStartFromOne= midiInfoStruct.midiMsgData(measureDirection,1)/deltaTimeSixteenthNote;
    numOfEndFromOne= (midiInfoStruct.midiMsgData(measureDirection,2)/deltaTimeSixteenthNote);
    numOfStartFromOne = numOfStartFromOne - numOfFirstFromOne+1;
    numOfEndFromOne = numOfEndFromOne - numOfFirstFromOne;
    
    x = ones(numsSixteenthNote,1);
    notesTimeMaping(numOfStartFromOne : numOfEndFromOne,noteNumCount) = x;
    noteNumCount = noteNumCount+1;
    
    %give the pitch information
   notesPitch(numOfStartFromOne : numOfEndFromOne,1)=midiInfoStruct.midiMsgData(measureDirection,3);
end

%% KNOW the same time having numbers of note (from step2 )
indices = [];
notesTimeMapingLength=size(notesTimeMaping);
SizeOfnOSTN = 1;
nextChord=0;  % 0 = in the next note 1=in the same note at same time
for i= 1 : notesTimeMapingLength(1,1)
    %sum the notes in same time
    indices = find(notesTimeMaping(i,:));
    indices= size(indices);
    numOfSameTimeNote(i,1) = indices(1,2);
    %{ 
    %IMPORTANT fulfill the really timeslot in matrix
    %cuz the count length w/ sixteenth is total length by measure
    %but that time is not standard time in our structure like
    % length in measure  1     2   3   4   5  6 7  8 
    %notes in side            60  62  62 64 64 0 0 61
    %so have some note is much longer than a sixteenth slot
    %so we need to translate to 
    % length in measure  1     2   2   3   3  4 5  6  7 8 
    %notes in side            60  62  62 64 64 0 0 61 0 0   
    %like this to fulfill the number signature 
    %}
        if((nextChord==1) && (indices(1,2)>=2))
            SizeOfnOSTN = SizeOfnOSTN+1;
            nextChord=1;
        else
            nextChord=0;
        end
    SizeOfnOSTN = SizeOfnOSTN+1;
end
sNOSTNfromNote=size(numOfSameTimeNote);
additionNote=0;
    %if we fixed length is more than note length from msg
    %add another blank to fulfill the leak.
if (sNOSTNfromNote<SizeOfnOSTN)
    additionNote= SizeOfnOSTN-sNOSTNfromNote(1,1);
    numOfSameTimeNote(end+additionNote,1)= 0;
end
%% Output the data to Chrom structure aobut this measure
SizeOfnOSTN
prePitch = 0;
%% give the note pitch
  notesPitch(end+1 : SizeOfnOSTN,1)=0;
for i = 1 : SizeOfnOSTN
        if numOfSameTimeNote(i,1) ~= 0
            %if notes length then 1 block of sixteenth
            if prePitch == notesPitch(i,1)
                notesInTheMeasure(i,5) = -2;
            %the next diff note start /// and save the start note pitch
            else
                notesInTheMeasure(i,5) = notesPitch(i,1);
                prePitch = notesPitch(i,1);
            end
            %block of sixteenth is empty , give the rest note   
        else
            notesInTheMeasure(i,5) = -1;
        end
end       
%% give the type of notes  // multiple note or single note       
%     single = 1 chord=2  noneNote=0
countNum = 1;
for i = 1 : SizeOfnOSTN
    if numOfSameTimeNote(i,1) == 0
            if i~=1
                if numOfSameTimeNote(i-1,1)==2
                    countNum = countNum+1;
                end
            end
        notesInTheMeasure(i,2) = 0;
        notesInTheMeasure(i,1) = countNum;
        countNum = countNum+1;
    elseif numOfSameTimeNote(i,1) == 1
            if i~=1
                if numOfSameTimeNote(i-1,1)==2
                    countNum = countNum+1;
                end
            end
        notesInTheMeasure(i,2) = 1;
        notesInTheMeasure(i,1) = countNum;
        countNum = countNum+1;
    else
        notesInTheMeasure(i,2) = 2;
        notesInTheMeasure(i,1) = countNum;
    end
end
%% give the tonal 
%the rule is
%                          1   2   3    4     5   6      7     8
%                        'C','G','D', 'A', 'E','B',  'F#', 'C#'
%                         -1 -2   -3    -4     -5    -6     -7   
%                       'F','Bb','Eb','Ab','Db','Gb','Cb'
%                               major *1  minor*2   
major =1; minor =2;
if midiInfoStruct.tonal(2,1)==0
    notesInTheMeasure(:,3) = midiInfoStruct.tonal(1,1)*major;
else
    notesInTheMeasure(:,3) = midiInfoStruct.tonal(1,1)*minor;
end
%% give the numbers of the measure at rhythm cloum
 notesInTheMeasure(:,6) = midiInfoStruct.rhythm;
%% give the octave
for i = 1 : SizeOfnOSTN
    %make the detection the notes where octave inside then more possible
    %at that octave
    % 5 is the octave  starting from middle of the piano c , value 60-72
    % like this rule
    currentTonal(i,1) = round(notesPitch(i,1)/12);
end
    %find the most appeared octave in this measure
measureOctave = mode(currentTonal);
notesInTheMeasure(:,4) = measureOctave;

midiInfoStruct.notesInTheMeasure = notesInTheMeasure;