function samplePriorityNote = BassNoteChoice(sfcNPMatrix)
%%part1, trans every rank count to the choice percent
%%part2, choice the bassnote from percentwheel


%% find which note is top weighted
sameWeight = 0; %have counting used
sameWeightMatrix = [100,3];
for m= 1 : sizeB
    choiceNoteMatrix = sfcNPMatrix.beat(1,m).rank;
    choiceNoteMatrix = sortrows(choiceNoteMatrix,-5);
    %% top weighted note have more then 1 or not
    sizeCNM = size(choiceNoteMatrix);
    for n = 2 : sizeCNM(1,1)
        %has any note same weight with topedst note weight
        if choiceNoteMatrix.sortWeight(n,1) == choiceNoteMatrix.sortWeight(1,1)
            sameWeight = sameWeight+1;
            %record which note have sameweight
            sameWeightMatrix(sameWeight,1) = choiceNoteMatrix.sortWeight(n,1);
            %record which note have sameweight with which pitch
            sameWeightMatrix(sameWeight,2) = choiceNoteMatrix.sortWeight(n,3);
            sameWeightMatrix(sameWeight,3) = choiceNoteMatrix.sortWeight(n,4);
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