function sampleFrameChoice = SampleFrameChoiceTranslate(sampleFrameChoice,pMeasure,pBeat,mainTonal,notePriorityInBeat,cL,sfcNotesRank)
%% choose top high priorityBeat in mainmelo
mainPriorityNote = notePriorityInBeat(1,1);
%% choose top high priorityBeat in sampleMelo
samplePriorityNote = sfcNotesRank.measure(1,pMeasure).beat(1,pBeat).samplePriorityNote;
%% init musical alphabet 
musicalAlphabet = zeros(2,12);
musicalAlphabetExtend = [8 9 10 11 12];
%% tonal meaning maping
tonalMajorWheel = [-6 -5 -4 -3 -2 -1 1 2 3 4 5 6]; % -6 = 7 F# =Gb
tonalMinorWheel = [-3 -2 -1 1 2 3 4 5 6 -6 -5 -4];
%% note meaning maping
tonalMajorWheelMod = [6 1 8 3 10 5 0 7 2 9 4 11]; %pitch mod 12
tonalMinorWheelMod = [3 10 5 0 7 2 9 4 11 6 1 8];
%% 1~7 note in the music alphabet  8~11 out of music alphabet
major = [1 8 2 9 3 4 10 5 11 6 12 7]; %  f f h f f f   
minor = [1 8 2 3 9 4 10 5 6 11 7 12];   % f h f f h f
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
     if loopEdge >= 12
        musicalAlphabet(2,i) = mainTonalNote + i - 1 -12;
     else
        musicalAlphabet(2,i) = mainTonalNote + i - 1;
     end
end
%% trans Notes to the musical alphabet meaning
%   ref distance about notes main and sample 
mainPriorityNote = mod(mainPriorityNote,12);
samplePriorityNote = mod(samplePriorityNote,12);
mPNoteInMAIndex = find(musicalAlphabet(2,:)==mainPriorityNote,1,'first');
sPNoteInMAIndex = find(musicalAlphabet(2,:)==samplePriorityNote,1,'first');
mPNoteInMA = musicalAlphabet(1,mPNoteInMAIndex);
sPNoteInMA = musicalAlphabet(1,sPNoteInMAIndex);
%% fix sPNoteInMA mPNoteInMA have some note not in standard Musical alphabet
findMPNoteInMA = find(musicalAlphabetExtend(1,:) == mPNoteInMA,1,'first');
if isempty(findMPNoteInMA) == 0
    pMeasure
    pBeat
    mPNoteInMA = MainNoteAlphabetFix(musicalAlphabet,mPNoteInMAIndex,mainTonal);
    disp('warning SampleFrameChoiceTranslate Line:61');
    disp('warning mainPriorityNote not in the standard musicalAlphabet \n');
end
findSPNoteInMA = find(musicalAlphabetExtend(1,:)  == sPNoteInMA,1,'first');
if isempty(findSPNoteInMA) == 0
    sPNoteInMA = MainNoteAlphabetFix(musicalAlphabet,sPNoteInMAIndex,mainTonal);
    disp('warning SampleFrameChoiceTranslate Line:67');
    disp('warning samplePriorityNote not in the standard musicalAlphabet \n');
end
%%   ref distance about notes main and sample 
BassNoteDistance = mPNoteInMA - sPNoteInMA;
%% shift note from note in the chord import(BassNote) to the mainpprioritynote
for j = 1 : cL
    sizeOfSFC = size(sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).noteContent,1);
    for i = 1 : sizeOfSFC
        if sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).noteContent(i,5)>=30
            noteNeedTransPitch = mod(sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).noteContent(i,5),12);
            %noteNeedTransOct = fix(sampleFrameChoice.measure(1,1).beat(1,pBeat+j-1).noteContent(i,5)/12);
            noteNeedTransOct = sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).noteContent(i,4);
            noteNeedTransIndex = find(musicalAlphabet(2,:) == noteNeedTransPitch,1,'first');
            noteNeedTransMA = musicalAlphabet(1,noteNeedTransIndex);
            noteNeedTransPitch = NoteTrans(noteNeedTransMA,musicalAlphabet,musicalAlphabetExtend,BassNoteDistance);
            %% repair new pitch to origin octative
            noteNeedTransPitch = (noteNeedTransOct*12)+noteNeedTransPitch;
            sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).noteContent(i,5) = noteNeedTransPitch;  
        end
    end
    %{
    sizeOfSFCN = size(sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).note,2);
    for m = 1 : sizeOfSFCN
         sizeOfSFCNContent = size(sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).note(1,m).noteContent,1);
        for k = 1 : sizeOfSFCNContent
            if sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).noteContent(i,5)>=30
                noteNeedTransPitch = mod(sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).note(1,m).noteContent(k,5),12);
                %noteNeedTransOct = fix(sampleFrameChoice.measure(1,1).beat(1,pBeat+j-1).note(1,m).noteContent(k,5)/12);
                noteNeedTransOct = sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).note(1,m).noteContent(k,4);
                noteNeedTransIndex = find(musicalAlphabet(2,:) == noteNeedTransPitch,1,'first');
                noteNeedTransMA = musicalAlphabet(1,noteNeedTransIndex);
                noteNeedTransPitch = NoteTrans(noteNeedTransMA,musicalAlphabet,musicalAlphabetExtend,BassNoteDistance);
                %% repair new pitch to origin octative
                noteNeedTransPitch = (noteNeedTransOct*12)+noteNeedTransPitch;      
                sampleFrameChoice.measure(1,pMeasure).beat(1,pBeat+j-1).note(1,m).noteContent(k,5) = noteNeedTransPitch;
            end
        end 
    end 
    %}
end
 


