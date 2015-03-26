function samplePriorityNote = BassNoteChoice(sfcNPMatrix)
%%part1, trans every rank count to the choice percent
%%part2, choice the bassnote from percentwheel

for m= 1 : sizeB
    totalSamePitchWeight = sum(sfcNPMatrix.beat(1,m).rank(:,5));
    totalSameLengthWeight = sum(sfcNPMatrix.beat(1,m).rank(:,6));
    totalLengthWeight = sum(sfcNPMatrix.beat(1,m).rank(:,2)); 
    lWBonus = totalLengthWeight*0.1;
    totalWeight = round(lWBonus)*(totalSamePitchWeight+totalSameLengthWeight);
    
    indexNotes = size(notesRank.beat(1,m).rank,1);
    for n = 1 : indexNotes
       noteWeight = sfcNPMatrix.beat(1,m).rank(n,2)+(sfcNPMatrix.beat(1,m).rank(n,5)+sfcNPMatrix.beat(1,m).rank(n,6))*lWBonus;
       %making percentWheel create at rank row 7
       percenWeight = noteWeight/totalWeight;
       if n == 1
        sfcNPMatrix.beat(1,m).rank(n-1,7) = percenWeight;
       else
        sfcNPMatrix.beat(1,m).rank(n-1,7) = sfcNPMatrix.beat(1,m).rank(n-1,7)+percenWeight;
       end
    end
    
    bassNoteChoice = rand();
    WheelMatrix = sfcNPMatrix.beat(1,m).rank(:,7);
    = Binarysearch(WheelMatrix,bassNoteChoice,indexNotes+1);

    
    
    
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