function Melodyexport(mainMelody,version)

sizeMM = size(mainMelody.notesInTheMeasure,1);
N = sizeMM;  % num notes
M = zeros(N,6);
ticksPerSixteenthNote = mainMelody.ticksPerQuarterNote/4;
duration=0;
countNodePrev = 1;
preTDT=0;
countMultiNote=1;
MultiNote=zeros(1,10);

%{
for i = 1 : 1
    a = 'title';
    if i <=5
        a = strcat(gaDat.chordImportInfo(i).exportVersion,'.mid');
       
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


for i = 1: sizeMM
totalDeltaTimes = mainMelody.notesInTheMeasure(i,1)*ticksPerSixteenthNote;
    if (mainMelody.notesInTheMeasure(i,4) == -1)
    elseif (mainMelody.notesInTheMeasure(i,4) <= -2)
        if MultiNote(1,1)==1;
           duration = duration + ticksPerSixteenthNote;
           M(countNodePrev-1,5) =  totalDeltaTimes - duration - ticksPerSixteenthNote ;  % note on:  notes start every .5 seconds 
           M(countNodePrev-1,6) = totalDeltaTimes;   % note off: each note has duration .5 seconds  
        else
            pRestNote=abs(mainMelody.notesInTheMeasure(i,4));
            whichRestNote = find(MultiNote==pRestNote,1);
                if preTDT==totalDeltaTimes
                    %do nothing
                else
                duration = duration + ticksPerSixteenthNote;
                end
            M(countNodePrev-(countMultiNote-whichRestNote+1),5) =  totalDeltaTimes - duration - ticksPerSixteenthNote ;  % note on:  notes start every .5 seconds 
            M(countNodePrev-(countMultiNote-whichRestNote+1),6) = totalDeltaTimes;   % note off: each note has duration .5 seconds  
        end
   else
           M(countNodePrev,1) = 1;         % all in track 1
           M(countNodePrev,2) = 1;         % all in channel 1
           M(countNodePrev,3) = mainMelody.notesInTheMeasure(i,4);
           M(countNodePrev,4) = mainMelody.notesInTheMeasure(i,5);
           M(countNodePrev,5) = totalDeltaTimes - ticksPerSixteenthNote;  % note on:  notes start every .5 seconds    
           M(countNodePrev,6) = totalDeltaTimes;   % note off: each note has duration .5 seconds 
           countNodePrev = countNodePrev+1;
           duration=0;
           
            if preTDT==totalDeltaTimes
                countMultiNote= countMultiNote+1;
                MultiNote(1,1) = 2;
                MultiNote(1,countMultiNote) = MultiNote(1,countMultiNote-1) +1;
            else
                countMultiNote=1;
                MultiNote(1,countMultiNote) =1;
            end
   end
preTDT = totalDeltaTimes;
end
totalRow=find(M(:,1) ,1,'last' );
resizeM = zeros(totalRow,6);
resizeM = M(1:totalRow,:);



%midi_new = matrix2midi(resizeM,mainMelody);
midi_new = matrix2midi(resizeM,mainMelody.ticksPerQuarterNote);
%///////in hooshuu mac desktop
fileExportPath = strcat('/Users/hooshuu/Documents/MATLAB/GA/GA_result/', version,'.mid');
%///////in  hp letop
%fileExportPath = strcat('C:\Users\HP\Documents\Matlab\GA\GA_result\', version,'.mid');
writemidi(midi_new, fileExportPath);