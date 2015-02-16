function sampleFrameChoice = SampleFrameChoiceTranslate(mainTonal,sampleFrameChoice,pBeat,notePriorityInBeat,sfcNPMatrix)

mainTonal;
sampleFrameChoice;
pBeat;
notePriorityInBeat;
major = [1 3 5 6 8 10 12]; %  f f h f f f 
minor = [1 3 4 6 8 9 11];   % f h f f h f

if mainTonal(2,1) == 0
tonalWheel = major;
else
tonalWheel = minor;
end
%% get the meaning of choiced beat frame
%    create  chord array at beat frame with same note appeard counting
sfcNPMatrix = NotePriorityMatrix(sampleFrameChoice,1);
%% choose top high priorityBeat
mainPriorityNotePitch = mod(notePriorityInBeat(1,1),12);
mainPriorityNoteOctive = fix(notePriorityInBeat(1,1)/12);
%% choising the note in chord array ane the note is nearly mainPriorityNote
sfcBassNote = BassNoteInChordMatrix(sfcNPMatrix,mainPriorityNotePitch,mainPriorityNoteOctive);
%% shift note from note in the chord import(BassNote) to the mainpprioritynote
sizeOfSFC = size(sampleFrameChoice.beat(1,pBeat).noteContent,1);
for i = 1 : sizeOfSFC
        sampleFrameChoice.beat(1,pBeat).noteContent(i,5) = sampleFrameChoice.beat(1,pBeat).noteContent(i,5) + notePriorityModed;  
end

sizeOfSFCN = size(sampleFrameChoice.beat(1,pBeat).note,2);
for i = 1 : sizeOfSFCN
    sizeOfSFCNContent = size(sampleFrameChoice.beat(1,pBeat).note(1,i).noteContent,1);
    for j = 1 : sizeOfSFCNContent
        	sampleFrameChoice.beat(1,pBeat).note(1,i).noteContent(j,5) = sampleFrameChoice.beat(1,pBeat).note(1,i).noteContent(j,5) + notePriorityModed;
    end 
end

