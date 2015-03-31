function samplePriorityNote = BassNoteChoice(sfcNPMatrix,pBeat)
%%part1, trans every rank count to the choice percent
%%part2, choice the bassnote from percentwheel


    totalSamePitchWeight = sum(sfcNPMatrix.beat(1,pBeat).rank(:,5));
    totalSameLengthWeight = sum(sfcNPMatrix.beat(1,pBeat).rank(:,6));
    totalLengthWeight = sum(sfcNPMatrix.beat(1,pBeat).rank(:,2)); 
    lWBonus = totalLengthWeight*0.1;
    totalWeight = round(lWBonus)*(totalSamePitchWeight+totalSameLengthWeight);
    
    indexNotes = size(notesRank.beat(1,pBeat).rank,1);
    for n = 1 : indexNotes
       noteWeight = sfcNPMatrix.beat(1,pBeat).rank(n,2)+(sfcNPMatrix.beat(1,pBeat).rank(n,5)+sfcNPMatrix.beat(1,pBeat).rank(n,6))*lWBonus;
       %making percentWheel create at rank row 7
       percenWeight = noteWeight/totalWeight;
       if n == 1
        sfcNPMatrix.beat(1,pBeat).rank(n-1,7) = percenWeight;
       else
        sfcNPMatrix.beat(1,pBeat).rank(n-1,7) = sfcNPMatrix.beat(1,pBeat).rank(n-1,7)+percenWeight;
       end
    end
    
    bassNoteChoice = rand();
    WheelMatrix = sfcNPMatrix.beat(1,pBeat).rank(:,7);
    samplePriorityNote = Binarysearch(WheelMatrix,bassNoteChoice,indexNotes+1);
