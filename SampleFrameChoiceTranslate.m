function sampleFrameChoice = SampleFrameChoiceTranslate(mainTonal,sampleFrameChoice,pBeat,notePriorityInBeat)

mainTonal;
pBeat;

%{
%%tonal meaning maping
tonalMajorWheel = [-6 -5 -4 -3 -2 -1 1 2 3 4 5 6]; % -6 = 7 F# =Gb
tonalMinorWheel = [-3 -2 -1 1 2 3 4 5 6 -6 -5 -4];

%%note meaning maping
tonalMajorWheelMod = [6 1 8 3 10 5 0 7 2 9 4 11]; %pitch mod 12
tonalMinorWheelMod = [3 10 5 0 7 2 9 4 11 6 1 8];

priorityCount
 = sTonal(1,1);
 = sTonal(1,2);
%}

major = [1 3 5 6 8 10 12]; %  f f h f f f 
minor = [1 3 4 6 8 9 11];   % f h f f h f

if mainTonal(2,1) == 0
tonalWheel = major;
else
tonalWheel = minor;
end
%% choose top high priorityBeat
mainPriorityNote = notePriorityInBeat(1,1);
%% sample tonal used to be complement
sTonal = sampleFrameChoice.tonal;
%% get the meaning of choiced beat frame
%    create  chord array at beat frame with same note appeard counting
sfcNPMatrix = NotePriorityMatrix(sampleFrameChoice,1);
%% choising the note in chord array ane the note is nearly mainPriorityNote
sfcNPMatrix = BassNoteInChordMatrix(sfcNPMatrix,sTonal,tonalWheel);
%%
samplePriorityNote = 0;
%% find which note is top weighted
sameWeight = 0; %have counting used
sameWeightMatrix = [100,3];
sizeB = size(sfcNPMatrix.beat,2);
for j = 1 : sizeB
    choiceNoteMatrix = sfcNPMatrix.beat(1,j).rank;
    choiceNoteMatrix.sortWeight = sortrows(choiceNoteMatrix,-5);
    %% top weighted note have more then 1 or not
    sizeCNM = size(choiceNoteMatrix);
    for k = 2 : sizeCNM(1,1)
        %has any note same weight with topedst note weight
        if choiceNoteMatrix.sortWeight(k,1) == choiceNoteMatrix.sortWeight(1,1)
            sameWeight = sameWeight+1;
            %record which note have sameweight
            sameWeightMatrix(sameWeight,1) = choiceNoteMatrix.sortWeight(k,1);
            %record which note have sameweight with which pitch
            sameWeightMatrix(sameWeight,2) = choiceNoteMatrix.sortWeight(k,3);
            sameWeightMatrix(sameWeight,3) = choiceNoteMatrix.sortWeight(k,4);
        end
    end
    sameWeightMatrix = EmptyItemFilter(sameWeightMatrix);
end
%% top weighted note have more then 1 or not
if sameWeight>=1
    %%if true
        %%and have some note is samepitch  
        %%find which note is variable with others note then other topest note
else
    
%%if false :only one topest note
    %    is that bassnote? maybe really bass , that means not belone chord
    %    properties ,is belone to bass track , we need traslate this note to
    %    same octaive with other chord
    %%do ::  find more octative we have at this beat trans bass note to that
    %    octative
    
end
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

