function noteAdd = SameLengPlus(gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength)
noteAdd = zeros(noteLenVari,notePropertyCreate);
     noteAdd(1,:) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
     noteAdd(1,3) = noteLenVari;
     if noteLengthCreate > 1
         for noteLength = 2 : noteAdd(1,3)
             noteAdd(noteLength,:) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
             noteAddIndex = noteAdd(1,1) + noteLength - 1;
             noteAdd(noteLength,1) = noteAddIndex;
             noteAdd(noteLength,3) = 0;
         end
     end