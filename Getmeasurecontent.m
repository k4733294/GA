function midiInfoStruct = Getmeasurecontent(midiInfoStruct)
%%
whichMeasureWeStart = midiInfoStruct.whichMeasureWeStart;
startDeltaTime = (whichMeasureWeStart-1)*midiInfoStruct.meausreLength+midiInfoStruct.midiMsgData(1,1);
endDeltaTime = (startDeltaTime)+midiInfoStruct.meausreLength*midiInfoStruct.howManyMeasureWeWant;
deltaTimeQuarterNote = midiInfoStruct.ticksPerQuarterNote;
deltaTimeSixteenthNote = deltaTimeQuarterNote/4;
%% make the meaureLength to the parts of SixteenthNote in the notesInTheMeasure
measurelength= endDeltaTime - startDeltaTime;
numsMeasurePieceOfSixteenthNote = measurelength/deltaTimeSixteenthNote;
numsMeasurePieceOfSixteenthNote = round(numsMeasurePieceOfSixteenthNote);
notesPitch = zeros(numsMeasurePieceOfSixteenthNote,1);
notesVelocity = zeros(numsMeasurePieceOfSixteenthNote,1);
%% PREPARE to translate the delta time of note to chrom struct infomation
%----------------------------------------------------------------------------------------------------------------------------------------------
measureStartNote = find(midiInfoStruct.midiMsgData(:,1)>=startDeltaTime);
measureStartNote = min(measureStartNote);
measureEndNote = find(midiInfoStruct.midiMsgData(:,2)<=endDeltaTime);
measureEndNote = max(measureEndNote);

totalMeasureNote=(measureEndNote-measureStartNote+1)/2;
totalMeasureNote = ceil(totalMeasureNote);
notesTimeMaping = zeros(numsMeasurePieceOfSixteenthNote,totalMeasureNote);
notesNoteCutMaping = zeros(numsMeasurePieceOfSixteenthNote,totalMeasureNote);
numOfFirstFromOne= midiInfoStruct.midiMsgData(measureStartNote,1)/deltaTimeSixteenthNote;
%% CREATE the table to know the time having more than one note 
%    next step is combine the data and give the the type define
noteNumCount=1;
alignStartRest=midiInfoStruct.midiMsgData(measureStartNote,1) - startDeltaTime;
if alignStartRest~=0
alignStartRest=alignStartRest/deltaTimeSixteenthNote;
alignStartRest=round(alignStartRest);
x = zeros(alignStartRest,1);
notesTimeMaping(1 : alignStartRest,noteNumCount) = x;
end
a=1;
for measureDirection = measureStartNote : measureEndNote
   
    numOfStartFromOne= midiInfoStruct.midiMsgData(measureDirection,1)/deltaTimeSixteenthNote;
    numOfEndFromOne = midiInfoStruct.midiMsgData(measureDirection,2)/deltaTimeSixteenthNote;
    numOfStartFromOne = numOfStartFromOne - numOfFirstFromOne+1 + alignStartRest;
    numOfEndFromOne = numOfEndFromOne - numOfFirstFromOne + alignStartRest;
    numOfStartFromOne = round(numOfStartFromOne);
    numOfEndFromOne = round(numOfEndFromOne);
    
    if  notesTimeMaping(numOfStartFromOne : numOfEndFromOne,noteNumCount)~=0
        noteNumCount = noteNumCount+1;      
    else
        noteNumCount=1;
    end
    %{
    %trace the error about notelength is not integer
     disp('numsSixteenthNote  ')
     isfloat (numsSixteenthNote)
     disp(' isflost num')
     disp(numsSixteenthNote)
     disp(', rhythmnum')
     disp(midiInfoStruct.rhythm)
    if (midiInfoStruct.rhythm==4) &&  isfloat(numsSixteenthNote)==true
    y=['trace getmeasurecontent 49 measureDirection',measureDirection];
    disp(y)
    disp(measureDirection)
    y=['deltaTimeQuarterNote',deltaTimeQuarterNote];
    disp(y)
    disp(deltaTimeQuarterNote)
    y=['deltaTimeSixteenthNote',deltaTimeSixteenthNote];
    disp(y)
    disp(deltaTimeSixteenthNote)
    y=['numsSixteenthNote',numsSixteenthNote];
    disp(y)
    disp(numsSixteenthNote)
    disp('numOfStartFromOne')
    disp(numOfStartFromOne)
    disp('numOfEndFromOne')
    disp(numOfEndFromOne)
    end
    %}
    numOfTotal = numOfEndFromOne - numOfStartFromOne + 1;
    x = ones(numOfTotal,1);
    notesTimeMaping(numOfStartFromOne : numOfEndFromOne,noteNumCount) = x;
    %give the note start info
    %if we got the note start, we give the new pitch here
    %or we give the zero on it.
    notesNoteCutMaping(numOfStartFromOne : numOfEndFromOne,noteNumCount) = 0;
    notesNoteCutMaping(numOfStartFromOne,noteNumCount) = midiInfoStruct.midiMsgData(measureDirection,3);
    %give the pitch information
    notesPitch(numOfStartFromOne : numOfEndFromOne,noteNumCount)=midiInfoStruct.midiMsgData(measureDirection,3);
    notesVelocity(numOfStartFromOne : numOfEndFromOne,noteNumCount)=midiInfoStruct.midiMsgData(measureDirection,4);
end

%% KNOW the same time having numbers of note (from step2 )
notesTimeMapingLength=size(notesTimeMaping);
numOfSameTimeNote = zeros(notesTimeMapingLength(1,1),1);
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
end
%% give the note pitch
count=1;
notesInTheMeasure = zeros(notesTimeMapingLength(1,1),5);
for i = 1 : notesTimeMapingLength(1,1)
        if numOfSameTimeNote(i,1) ~= 0
            %if notes length then 1 block of sixteenth
            if numOfSameTimeNote(i,1)>1
                countMultiSustain=0;
                for j = 1:numOfSameTimeNote(i,1)
                     if notesNoteCutMaping(i,j) == notesPitch(i,j)
                        %the next diff note start
                        notesInTheMeasure(count,4) = notesPitch(i,j);
                     else
                        %note length extended
                        notesInTheMeasure(count,4) = -2 + countMultiSustain;
                        countMultiSustain=countMultiSustain-1;
                     end
                        %block of sixteenth is empty , give the rest note 
                        count = count+1;
                end
            else
                if notesNoteCutMaping(i,1) == notesPitch(i,1)
                    %the next diff note start
                    notesInTheMeasure(count,4) = notesPitch(i,1);
                else
                     %note length extended
                     notesInTheMeasure(count,4) = -2;
                end
                %block of sixteenth is empty , give the rest note   
                    count = count+1;
            end
        else
            notesInTheMeasure(count,4) = -1;
            count = count+1;
        end
end
%% give the type of notes  // multiple note or single note       
%     single = 1 chord=2  noneNote=0
countMulti = 1;
count = 1;
for i = 1 : notesTimeMapingLength(1,1)
    if numOfSameTimeNote(i,1) == 0
        notesInTheMeasure(count,2) = 0;
        notesInTheMeasure(count,1) = countMulti;
        countMulti = countMulti+1;
        count=count+1;
    elseif numOfSameTimeNote(i,1) == 1
        notesInTheMeasure(count,2) = 1;
        notesInTheMeasure(count,1) = countMulti;
        countMulti =countMulti+1;
        count=count+1;
    else
        for j =1 : numOfSameTimeNote(i,1)
            notesInTheMeasure(count,2) = 2;
            notesInTheMeasure(count,1) = countMulti;
            count = count+1;
        end
        countMulti =countMulti+1;
    end
end
count=1;

%% give the octave
for i = 1 : notesTimeMapingLength(1,1)
    %make the detection the notes where octave inside then more possible
    %at that octave
    % 5 is the octave  starting from middle of the piano c , value 60-72
    % like this rule
    
    if numOfSameTimeNote(i,1) ==1
        notesInTheMeasure(count,3) = fix(notesPitch(i,1)/12);
        notesInTheMeasure(count,5) = notesVelocity(i,1);
        count = count+1;
    elseif numOfSameTimeNote(i,1) ==0
        count = count+1;
    else
        for j = 1 : numOfSameTimeNote(i,1)
            notesInTheMeasure(count,3) = fix(notesPitch(i,j)/12);
            notesInTheMeasure(count,5) = notesVelocity(i,j);
            count = count+1;
        end
    end
end

midiInfoStruct.notesInTheMeasure = notesInTheMeasure;