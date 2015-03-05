function sfcNPMatrix = BassNoteInChordMatrix(sfcNPMatrix)

%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/notesRank.mat'); 


%find 
    sizeB = size(sfcNPMatrix.beat,2);
   %loop beat
for j = 1 : sizeB
       sizeNInBar = size(sfcNPMatrix.beat(1,j).rank,1);
       %loop note
    for k = 1 : sizeNInBar
        choiceNote = sfcNPMatrix.beat(1,j).rank(k,4);
        choiceNotes = find(sfcNPMatrix.beat(1,j).rank(:,4)==choiceNote);
        sizeChoiceNotes = size(choiceNotes);
        % same pitch appeard we add weight
        if sizeChoiceNotes(1,1) ~= 1
            for m = 1 : sizeChoiceNotes
            %weight here
            choiceNotes(m,2) = sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),2)+5;
            %added to rank col 5 
            sfcNPMatrix.beat(1,j).rank(choiceNotes(m,1),5) = choiceNotes(m,2);
            end
        else
            %do not any weight
            sfcNPMatrix.beat(1,j).rank(k,5) = sfcNPMatrix.beat(1,j).rank(k,2);
        end
    end
end
