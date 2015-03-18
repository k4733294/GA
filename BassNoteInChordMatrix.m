function sfcNPMatrix = BassNoteInChordMatrix(sfcNPMatrix)
%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/notesRank.mat'); 

%find 
sizeB = size(sfcNPMatrix.beat,2);
   %loop beat
for j = 1 : sizeB
       sizeNInBar = size(sfcNPMatrix.beat(1,j).rank,1);
       %loop note
    for n = 1 : sizeNInBar
        %%partA find same pitch
        choiceNote = sfcNPMatrix.beat(1,j).rank(n,4);
        choiceNotes = find(sfcNPMatrix.beat(1,j).rank(:,4)==choiceNote);
        sizeChoiceNotes = size(choiceNotes);
        % same pitch appeard we add weight
        if sizeChoiceNotes(1,1) ~= 1
            for m = 1 : sizeChoiceNotes
            %added to rank col 5
                if  ismember(sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),5),1) == 1
                    sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),5) = sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),5)+1;
                else
                    sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),5) = 1;    
                end
            end
        else
            %do not any weight
            sfcNPMatrix.beat(1,j).rank(n,5) = 0;
        end
        clearvars choiceNotes
        
        %%partB find same weight
        choiceNote = sfcNPMatrix.beat(1,j).rank(n,2);
        choiceNotes = find(sfcNPMatrix.beat(1,j).rank(:,2)==choiceNote);
        sizeChoiceNotes = size(choiceNotes);
        % same pitch appeard we add weight
        if sizeChoiceNotes(1,1) ~= 1
            for m = 1 : sizeChoiceNotes
            %added to rank col 5
                if  ismember(sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),6),1) == 1
                    sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),6) = sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),6)+1;
                else
                    sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),6) = 1;    
                end
            end
        else
            %do not any weight
            sfcNPMatrix.beat(1,j).rank(n,5) = 0;
        end
        clearvars choiceNotes
    end
end
