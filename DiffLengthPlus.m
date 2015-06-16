function noteAdd = DiffLengthPlus(gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength)

   if noteLenVari > randNoteLength
         noteLenVariCount = noteLenVari;
         fixNoteLenVari = fix(noteLenVari/randNoteLength);
         modNoteLenVari = mod(noteLenVari,randNoteLength);
         crateNoteLen =0 ;
         if modNoteLenVari ~= 0
             crateNoteLen = fixNoteLenVari +1;
         end
         noteAdd = zeros(crateNoteLen,notePropertyCreate);
         noteAddLoop = 1;
         noteIndexLoop = 0;
         while noteLenVariCount > 0
             
             noteAdd(noteAddLoop,:) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
             if noteLenVariCount > randNoteLength
                 noteAdd(noteAddLoop,3) = randNoteLength;
             elseif noteLenVariCount < randNoteLength && noteLenVariCount >=0
                 noteAdd(noteAddLoop,3) = noteLenVariCount;
             end
             if noteIndexLoop == 0
                 noteIndexLoop = noteAdd(noteAddLoop,1);
                 noteAdd(noteAddLoop,1) = noteIndexLoop;
             else
                 noteAdd(noteAddLoop,1) = noteIndexLoop+1;
             end
             
             
             if noteAdd(noteAddLoop,3) > 1
                 for noteLength = 2 : noteAdd(noteAddLoop,3)
                     noteAdd(noteAddLoop + noteLength - 1,:) = noteAdd(noteAddLoop,:);
                     noteAddIndex = noteIndexLoop + noteLength -1;
                     noteAdd(noteAddLoop + noteLength - 1,1) = noteAddIndex;
                     noteAdd(noteAddLoop + noteLength - 1,3) = 0;
                 end
             end
             
             noteIndexLoop = noteAddIndex;
             noteAddLoop = noteAddLoop + noteLength;
             noteLenVariCount = noteLenVariCount - randNoteLength;
         end
     else
         noteAdd = zeros(noteLenVari,notePropertyCreate);
         noteAdd(1,:) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
         noteAdd(1,3) = noteLenVari;
         if noteLenVari > 1
             for noteLength = 2 : noteAdd(1,3)
                 noteAdd(noteLength,:) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,pMeasure).noteContent(noteAddIndexs(nAIndex,1),:);
                 noteAddIndex = noteAdd(1,1) + noteLength - 1;
                 noteAdd(noteLength,1) = noteAddIndex;
                 noteAdd(noteLength,3) = 0;
             end
         end
     end