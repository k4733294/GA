function sfcBassNote = BassNoteInChordMatrix(sfcNPMatrix,sTonal,tonalWheel)

load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/notesRank.mat'); 

sfcNPMatrix
sTonal
tonalWheel

%find 
    sizeB = size(sfcNPMatrix.beat,2);
   %loop beat
for j = 1 : sizeB 
       sizeNInBar = size(sfcNPMatrix.beat(1,j).rank,1);
       %loop note
    for k = 1 : sizeNInBar
        notesRank.beat(1,j).rank(k,3)
        notesRank.beat(1,j).rank(k,4)
    end
end