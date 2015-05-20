function Melodyexport(mainMelody,version)

sizeMM = size(mainMelody.notesInTheMeasure,1);
N = sizeMM;  % num notes
M = zeros(N,6);
ticksPerSixteenthNote = mainMelody.ticksPerQuarterNote/4;
countNodePrev = 1;

for i = 1: sizeMM
totalDeltaTimes = mainMelody.notesInTheMeasure(i,1)*ticksPerSixteenthNote;
    if (mainMelody.notesInTheMeasure(i,5) == -1)
    elseif (mainMelody.notesInTheMeasure(i,3) ~= 0)
           noteDeltaTimesLength = mainMelody.notesInTheMeasure(i,3)*ticksPerSixteenthNote;
           M(countNodePrev,1) = 1;         % all in track 1
           M(countNodePrev,2) = 1;         % all in channel 1
           M(countNodePrev,3) = mainMelody.notesInTheMeasure(i,5);
           M(countNodePrev,4) = mainMelody.notesInTheMeasure(i,6);
           M(countNodePrev,5) = totalDeltaTimes - ticksPerSixteenthNote ;  % note on:  notes start every .5 seconds    
           M(countNodePrev,6) = totalDeltaTimes + noteDeltaTimesLength - ticksPerSixteenthNote;   % note off: each note has duration .5 seconds 
           countNodePrev = countNodePrev+1;
    else
    end
end
%filter empty item in M
resizeM = EmptyItemFilter(M);
%midi_new = matrix2midi(resizeM,mainMelody);
midi_new = matrix2midi(resizeM,mainMelody.ticksPerQuarterNote);
%In hooshuu mac desktop
fileExportPath = strcat(version,'.mid');
%In hp letop
%fileExportPath = strcat('C:\Users\HP\Documents\Matlab\GA\GA_result\', version,'.mid');
writemidi(midi_new, fileExportPath);

%{
for i = 1 : 1
    a = 'title';
    if i <=5
        %a = strcat(gaDat.chordImportInfo(i).exportVersion,'.mid');
        
        a = strcat(fileExportPath);
       
        midi = readmidi(a);
    else
        a = strcat(gaDat.mainImportInfo.exportVersion,'.mid');
        midi = readmidi(a);
    end
Notes = midiInfo(midi,0);
[PR,t,nn] = piano_roll(Notes,1);
figure;
imagesc(t,nn,PR);
title(a);
axis xy;
xlabel('time (sec)');
ylabel('note number');
   
end
%}