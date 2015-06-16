 function gaDat = PatternMutbga(gaDat,pMeasure,IndicesMuta,randNoteLength,randMode)
 IndicesMutaChoice = IndicesMuta(1,1);
 octave = 12;
 maxMeasureLength = 16;
 maxPatternLength = 64;
 noteContent = gaDat.chromsome(1,IndicesMutaChoice).measure(1,pMeasure).noteContent;
 noteAddIndexs = find(noteContent(:,3)~=0);
 sizeOfNoteAddIndexs = size(noteAddIndexs,1);
 for nAIndex = 1 : sizeOfNoteAddIndexs
     noteContent = gaDat.chromsome(1,IndicesMutaChoice).measure(1,pMeasure).noteContent;
     %% pull out note we need and fix note octave info represent big bass
     noteLengthCreate = noteContent(noteAddIndexs(nAIndex,1),3);
     notePropertyCreate = size(noteContent(noteAddIndexs(nAIndex,1),:),2);
     %%adjust Note Length
     %%------------------------------------------------
     %%------------------------------------------------
     switch randMode
         case 1
             noteLengthCreate = noteContent(noteAddIndexs(nAIndex,1),3)*2;
         case 2
             noteLengthCreate = noteContent(noteAddIndexs(nAIndex,1),3)*2;
         case 3
             noteLengthCreate = noteContent(noteAddIndexs(nAIndex,1),3)/2;
             noteLengthCreate = round(noteLengthCreate);
         case 4
             noteLengthCreate = noteContent(noteAddIndexs(nAIndex,1),3)*2;
             noteLengthCreate = round(noteLengthCreate);
     end
     %%------------------------------------------------
     %%------------------------------------------------
     if noteLengthCreate > maxPatternLength
         noteLengthCreate = maxPatternLength;
         noteLenVari =  maxPatternLength;
     else
         noteLenVari  = noteLengthCreate;
     end
     %%
     noteAddIndex = noteContent(noteAddIndexs(nAIndex,1),1);
     noteAddPitch = noteContent(noteAddIndexs(nAIndex,1),5);
     
     sameIndexNoteStartIndex = find(noteContent(:,1) > noteAddIndex);
     sameIndexNoteEndIndex = find(noteContent(:,1) <= (noteAddIndex + noteLenVari -1 ) );
     sameIndexNoteIndex = intersect(sameIndexNoteStartIndex,sameIndexNoteEndIndex);
     
     samePitchsNoteIndex = find(noteContent(:,5) == noteAddPitch);
     sameStartNoteIndex = find(noteContent(:,3) ~= 0);
     PitchsStartIndex = intersect(samePitchsNoteIndex,sameStartNoteIndex);
     
     noteAddIndexsCritical = intersect(sameIndexNoteIndex,PitchsStartIndex);
     
     if isempty(noteAddIndexsCritical) == 0
         noteCriticalIndex = 1;
         noteCriticalFind = 0;
         while noteCriticalFind == 0;
             noteAddIndexFix = noteAddIndex + noteLenVari -1;
             if noteAddIndexFix >= noteContent(noteAddIndexsCritical(noteCriticalIndex,1),1)
                 noteLenVari = noteContent(noteAddIndexsCritical(noteCriticalIndex,1),1) - noteAddIndex;
                 noteCriticalFind = 1;
             end
             noteCriticalIndex = noteCriticalIndex + 1;
         end
         noteCriticalFind = 0;
     else
         % find result is empty
         %have no same ptich note will ctrical after propably
     end
     %%------------------------------------------------
     %%------------------------------------------------
     switch randMode
         case 1
             noteAdd = SameLengPlus(gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
         case 2
             noteAdd = DiffLengthPlus(gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
         case 3
             noteAdd = SameLengPlus(gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
         case 4
             noteAdd = DiffLengthPlus(gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
     end
     %%------------------------------------------------
     %%------------------------------------------------
     inMeasureFix = pMeasure;
     inMeasureUse = 0;
     for noteAddloopIndex = 1 : noteLenVari
         timeNow = noteAdd(noteAddloopIndex,1);
         if timeNow > maxMeasureLength
             inMeasureForward = fix(timeNow/maxMeasureLength);
             timeNow = mod(timeNow,maxMeasureLength);
             inMeasureFix = inMeasureFix + inMeasureForward;
             if inMeasureFix >= 33
                 break
             end
             %%
             noteAddIndex = mod(noteAdd(noteAddloopIndex,1),maxMeasureLength);
             if noteAddIndex == 0
                 noteAddIndex = maxMeasureLength;
                 timeNow = maxMeasureLength;
             end
             noteAdd(noteAddloopIndex,1) = noteAddIndex;
             %%
             inMeasureUse = 1;
         end
         timeNowIndexs = find(gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(:,1) == timeNow);
         timeNowIndexs(:,2) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(timeNowIndexs(:,1),5);
         IndexAlreadyNote = find(timeNowIndexs(:,2) == noteAdd(noteAddloopIndex,5));
         %% got the timeslide info for we insert node
         if isempty(IndexAlreadyNote) == 0
             nowTimeNoteIndex = timeNowIndexs(IndexAlreadyNote(1,1),1);
             if (inMeasureFix ~= pMeasure && gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(nowTimeNoteIndex,3) ~= 0)
                 if noteAdd(noteAddloopIndex,3) == 0
                 else
                 noteAdd(noteAddloopIndex,3) =  noteAddloopIndex;
                 end
                 noteLenVari = noteAddloopIndex;
             else
                 gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(timeNowIndexs(IndexAlreadyNote(1,1),1),:) = noteAdd(noteAddloopIndex,:);
             end
             multiIndexAlreadyNote = size(IndexAlreadyNote,1);
             if multiIndexAlreadyNote > 1
                 gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(timeNowIndexs(IndexAlreadyNote(2:end,1),1),:) = [];
                 TimeOfNoteAddIndexs(:,1) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(noteAddIndexs(:,1),1);
                 TimeOfNoteAddIndexs(:,2) = noteAddIndexs(:,1);
                 for i = 2 : multiIndexAlreadyNote
                     Now = IndexAlreadyNote(i,1);
                     NowOfSame = find(TimeOfNoteAddIndexs(:,2) == Now,1);
                     TimeOfNoteAddIndexs(NowOfSame,:) = [];
                     endOfSame = find(TimeOfNoteAddIndexs(:,2) > Now,1);
                     noteAddIndexs(endOfSame - 1 : end,1) = noteAddIndexs(endOfSame + 1 : end,1) - 1;
                 end
             end
         else
             timeInsert = timeNowIndexs(end,1);
             %% first part is above of noteAdd
             tempFromStart = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(1: timeInsert,:);
             %% second part is belowd of noteAdd
             % one of +1 is noteAdd
             tempFromInserted = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(timeInsert + 1 : end,:);
             
             if inMeasureUse ~= 1
                 %%
                 TimeOfNoteAddIndexs(:,1) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(noteAddIndexs(:,1),1);
                 TimeOfNoteAddIndexs(:,2) = noteAddIndexs(:,1);
                 %Now = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(noteAddIndexs(nAIndex,1),1);
                 Now = timeInsert;
                 endOfSame = find(TimeOfNoteAddIndexs(:,2) >= Now,1);
                 noteAddIndexs(endOfSame + 1 : end,1) = noteAddIndexs(endOfSame + 1 : end,1) + 1;
             end
             
             gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent = [tempFromStart ; noteAdd(noteAddloopIndex,:) ; tempFromInserted];
         end
         inMeasureFix = pMeasure;
         inMeasureUse = 0;
     end
 end
 
 