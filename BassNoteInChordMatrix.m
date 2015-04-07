function sfcNPMatrix = BassNoteInChordMatrix(sfcNPMatrix,pBeat)
%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/notesRank.mat'); 


sizeNInBar = size(sfcNPMatrix.beat(1,pBeat).rank,1);
%loop note
for n = 1 : sizeNInBar
%%partA find same pitch
choiceNote = sfcNPMatrix.beat(1,pBeat).rank(n,4);
choiceNotes = find(sfcNPMatrix.beat(1,pBeat).rank(:,4)==choiceNote);
sizeChoiceNotes = size(choiceNotes);
% same pitch appeard we add weight
if sizeChoiceNotes(1,1) ~= 1
    for m = 1 : sizeChoiceNotes
    %added to rank col 5
        if  exist('sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),5)','var') ~= 0
            sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),5) = sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),5)+1;
        else
            sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),5) = 1;    
        end
    end
else
    %do not any weight
    sfcNPMatrix.beat(1,pBeat).rank(n,5) = 0;
end
clearvars choiceNotes

%%partB find same weight
choiceNote = sfcNPMatrix.beat(1,pBeat).rank(n,2);
choiceNotes = find(sfcNPMatrix.beat(1,pBeat).rank(:,2)==choiceNote);
sizeChoiceNotes = size(choiceNotes);
% same pitch appeard we add weight
if sizeChoiceNotes(1,1) ~= 1
    for m = 1 : sizeChoiceNotes
    %added to rank col 5
        if  exist('sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),6)','var') ~= 0
            sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),6) = sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),6)+1;
        else
            sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),6) = 1;    
        end
    end
else
    %do not any weight
    sfcNPMatrix.beat(1,pBeat).rank(n,5) = 0;
end
clearvars choiceNotes
end

