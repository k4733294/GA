function samplePriorityNote = BassNoteChoice(sfcNPMatrix,pBeat)
%%part1, trans every rank count to the choice percent
%%part2, choice the bassnote from percentwheel

totalSamePitchWeight = 0;
if exist('sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),5)','var') ~= 0
    totalSamePitchWeight = sum(sfcNPMatrix.beat(1,pBeat).rank(:,5));
else
    totalSamePitchWeight = 0;
end

totalSameLengthWeight = 0;
if exist('sfcNPMatrix.beat(1,pBeat).rank(choiceNotes(m,1),6)','var') ~= 0
    totalSameLengthWeight = sum(sfcNPMatrix.beat(1,pBeat).rank(:,6));
else
    totalSameLengthWeight = 0;
end

totalLengthWeight = sum(sfcNPMatrix.beat(1,pBeat).rank(:,2)); 
lWBonus = totalLengthWeight*0.5;
totalWeight = totalLengthWeight + round(lWBonus)*(totalSamePitchWeight+totalSameLengthWeight);

indexNotes = size(sfcNPMatrix.beat(1,pBeat).rank,1);
for n = 1 : indexNotes
    NoteSamePitchWeight = 0;
    if exist('sfcNPMatrix.beat(1,pBeat).rank(n,5)','var') ~= 0
        NoteSamePitchWeight = sfcNPMatrix.beat(1,pBeat).rank(n,5);
    else
        NoteSamePitchWeight = 0;
    end
    NoteSameLengthWeight = 0;
    if exist('sfcNPMatrix.beat(1,pBeat).rank(n,6)','var') ~= 0
        NoteSameLengthWeight = sfcNPMatrix.beat(1,pBeat).rank(n,6);
    else
        NoteSameLengthWeight = 0;
    end

    noteWeight = sfcNPMatrix.beat(1,pBeat).rank(n,2)+(NoteSamePitchWeight+NoteSameLengthWeight)*lWBonus;
   %making percentWheel create at rank row 7
    percenWeight = noteWeight/totalWeight;
    if n == 1
        sfcNPMatrix.beat(1,pBeat).rank(1,7) = percenWeight;
   else
        sfcNPMatrix.beat(1,pBeat).rank(n,7) = sfcNPMatrix.beat(1,pBeat).rank(n-1,7)+percenWeight;
   end
end

%In general, you can generate N random numbers in the interval [a,b] with the formula r = a + (b-a).*rand(N,1).
bassNoteChoice = -0.01*(1-0.01).*rand();
WheelMatrix = sfcNPMatrix.beat(1,pBeat).rank(:,7);
samplePriorityNoteIndex = Binarysearch(WheelMatrix,bassNoteChoice,indexNotes+1);
samplePriorityNote = sfcNPMatrix.beat(1,pBeat).rank(samplePriorityNoteIndex,4);
