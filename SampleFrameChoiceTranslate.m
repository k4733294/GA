function sampleFrameChoice = SampleFrameChoiceTranslate(sampleFrameChoice,pBeat,mainTonal,notePriorityInBeat,cL)
%{
priorityCount
 = sTonal(1,1);
 = sTonal(1,2);
%}
%% nil which bassnote we want
samplePriorityNote = 0; 
%% choose top high priorityBeat in mainmelo
mainPriorityNote = notePriorityInBeat(1,1);
%% get the meaning of choiced beat frame
%    create  chord array at beat frame with same note appeard counting
sfcNPMatrix = NotePriorityMatrix(sampleFrameChoice,cL,pBeat);
%% choising the note in chord array ane the note is nearly mainPriorityNote
sfcNPMatrix = BassNoteInChordMatrix(sfcNPMatrix,pBeat);
%% output BassNote We need
samplePriorityNote = BassNoteChoice(sfcNPMatrix,pBeat);

%% init musical alphabet 
musicalAlphabet = zeros(2,11);
%% tonal meaning maping
tonalMajorWheel = [-6 -5 -4 -3 -2 -1 1 2 3 4 5 6]; % -6 = 7 F# =Gb
tonalMinorWheel = [-3 -2 -1 1 2 3 4 5 6 -6 -5 -4];
%% note meaning maping
tonalMajorWheelMod = [6 1 8 3 10 5 0 7 2 9 4 11]; %pitch mod 12
tonalMinorWheelMod = [3 10 5 0 7 2 9 4 11 6 1 8];
%% 1~7 note in the music alphabet  8~11 out of music alphabet
major = [1 8 2 9 3 4 10 5 11 6 7]; %  f f h f f f   
minor = [1 8 2 3 9 4 10 5 6 11 7];   % f h f f h f
%% trans Tonal to pitch sign , create musical alphabet matrix index 
if mainTonal(2,1) == 0
    MajorWheelIndex = find(tonalMajorWheel==mainTonal(1,1),1,'first');
    mainTonalNote = tonalMajorWheelMod(1,MajorWheelIndex);
    mainTonalNote = mod(mainTonalNote,12);
    musicalAlphabet(1,:) = major;
else
    MinorWheelIndex = find(tonalMinorWheel==mainTonal(1,1),1,'first');
    mainTonalNote = tonalMinorWheelMod(1,MinorWheelIndex);
    musicalAlphabet(1,:) = minor;
end
%% strut musical alphabet by mainTonal 
for i = 1 : 12 
     loopEdge = mainTonalNote + i - 1;
     if loopEdge > 12
        musicalAlphabet(2,i) = mainTonalNote + i - 1;
     else
          musicalAlphabet(2,i) = mainTonalNote + i - 1 - 12;
     end
end
%% trans Notes to the musical alphabet meaning
%   ref distance about notes main and sample 
mainPriorityNote = mod(mainPriorityNote,12);
samplePriorityNote = mod(samplePriorityNote,12);
mPNoteInMAIndex = find(musicalAlphabet(1,:)==mainPriorityNote,1,'first');
sPNoteInMAIndex = find(musicalAlphabet(1,:)==samplePriorityNote,1,'first');
mPNoteInMA = musicalAlphabet(2,mPNoteInMAIndex);
sPNoteInMA = musicalAlphabet(2,sPNoteInMAIndex);
%% fix sPNoteInMA mPNoteInMA have some note not in standard Musical alphabet
if mPNoteInMA == 8 || mPNoteInMA == 9 || mPNoteInMA == 10 || mPNoteInMA == 11
    mPNoteInMA = musicalAlphabet(2,mPNoteInMAIndex+1);
    disp('warning SampleFrameChoiceTranslate Line:61');
    disp('warning mainPriorityNote not in the standard musicalAlphabet \n');
    pause
end
if sPNoteInMA == 8 || sPNoteInMA == 9 || sPNoteInMA == 10 || sPNoteInMA == 11
    sPNoteInMA = musicalAlphabet(2,sPNoteInMAIndex+1);
    disp('warning SampleFrameChoiceTranslate Line:67');
    disp('warning mainPriorityNote not in the standard musicalAlphabet \n');
    pause
end
%%   ref distance about notes main and sample 
BassNoteDistance = sPNoteInMA - mPNoteInMA;
%% shift note from note in the chord import(BassNote) to the mainpprioritynote
sizeOfSFC = size(sampleFrameChoice.beat(1,pBeat).noteContent,1);
for i = 1 : sizeOfSFC
    noteNeedTransPitch = mod(sampleFrameChoice.beat(1,pBeat).noteContent(i,5),12);
    noteNeedTransOct = fix(sampleFrameChoice.beat(1,pBeat).noteContent(i,5)/12);
    noteNeedTransIndex = find(musicalAlphabet(1,:) == noteNeedTransPitch,1,'first');
    noteNeedTransMA = musicalAlphabet(2,noteNeedTransIndex);
%% B:: appeard noteNeedTransMA not
%     in standar musical alphabet
%% A:: fix noteNeedTransMA+BassNoteDistance
%     have situation  may big than 7
    noteNeedTransMA=noteNeedTransMA+BassNoteDistance;
%% trans noteNeedTransMA by musical alphabet to find new translated pitch 
    noteNeedTransPitch = musicalAlphabet(1,noteNeedTransMA);
%% repair new pitch to origin octative
    noteNeedTransPitch = noteNeedTransOct*noteNeedTransPitch;
    sampleFrameChoice.beat(1,pBeat).noteContent(i,5) = noteNeedTransPitch;  
end

sizeOfSFCN = size(sampleFrameChoice.beat(1,pBeat).note,2);
for j = 1 : sizeOfSFCN
    sizeOfSFCNContent = size(sampleFrameChoice.beat(1,pBeat).note(1,j).noteContent,1);
    for k = 1 : sizeOfSFCNContent
        	sampleFrameChoice.beat(1,pBeat).note(1,j).noteContent(k,5) = sampleFrameChoice.beat(1,pBeat).note(1,j).noteContent(j,5) + notePriorityModed;
    end 
end

