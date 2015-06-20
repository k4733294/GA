function selChMuta = PatternMutbgaFix(selChMuta,gaDat,pMeasure,IndicesMuta,randNoteLength,randMode)
 IndicesMutaChoice = IndicesMuta;
 maxMeasureLength = 16;
 maxPatternLength = 64;
 sizeOfMeasure = size(selChMuta.measure,2);
 noteContent = selChMuta.measure(1,pMeasure).noteContent;
 noteAddIndexs = find(noteContent(:,3)~=0);
 sizeOfNoteAddIndexs = size(noteAddIndexs,1);
 noteAddCreateNotDo = zeros(1,1000);
 noteLenVari = 0;
 for nAIndex = 1 : sizeOfNoteAddIndexs
     if nAIndex > sizeOfNoteAddIndexs
         break
     end
     findNoteAddCreate = isempty(find(noteAddCreateNotDo(1,:) == noteAddIndexs(nAIndex,1),1));
     if findNoteAddCreate ==0
         continue
     end
     noteContent = selChMuta.measure(1,pMeasure).noteContent;
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
             noteLengthCreate = noteContent(noteAddIndexs(nAIndex,1),3)/2;
             noteLengthCreate = round(noteLengthCreate);
     end
     %%------------------------------------------------
     %%------------------------------------------------
     if noteLengthCreate > maxMeasureLength
         noteLengthCreate = maxMeasureLength;
         noteLenVari =  maxMeasureLength;
     else
         noteLenVari  = noteLengthCreate;
     end
     %%
     %{
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
     %}
     %%------------------------------------------------
     %%------------------------------------------------
     switch randMode
         case 1
             noteAdd = SameLengPlus(selChMuta,gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
         case 2
             noteAdd = DiffLengthPlus(selChMuta,gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
         case 3
             noteAdd = SameLengPlus(selChMuta,gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
         case 4
             noteAdd = DiffLengthPlus(selChMuta,gaDat,IndicesMutaChoice,noteLenVari,notePropertyCreate,pMeasure,noteAddIndexs,nAIndex,noteLengthCreate,randNoteLength);
     end
     %%------------------------------------------------
     %%let end of measure length do not exceed mainimport length
     %{
     if noteAdd(1,3) <= 0
         disp('noteAdd minu error');
     end
     %}
     if pMeasure == sizeOfMeasure
         IndexEndOfMeasure = selChMuta.measure(1,pMeasure).noteContent(end,1);
         noteAddStarts = find(noteAdd(:,3)~=0);
         sizeOfNoteAddStarts= size(noteAddStarts,1);
         for nASIndex = 1 : sizeOfNoteAddStarts
             noteAddIndexExceed = noteAdd(noteAddStarts(nASIndex,1),1)+noteAdd(noteAddStarts(nASIndex,1),3)-1;
             if  noteAddIndexExceed > IndexEndOfMeasure
                 fixIndex = IndexEndOfMeasure - noteAdd(noteAddStarts(nASIndex,1),1) + 1;
                 if fixIndex <= 0
                     disp('fixIndex <= 0');
                 end
                 noteAdd(noteAddStarts(nASIndex,1),3) = fixIndex;
                 if nASIndex ~= sizeOfNoteAddStarts
                     noteAdd(noteAddStarts(nASIndex,1) + fixIndex : noteAddStarts(nASIndex + 1,1)-1 ,:) = [];
                 else
                     noteAdd(noteAddStarts(nASIndex,1)+ fixIndex : end,:) = [];
                 end
             end
             noteAddStarts = find(noteAdd(:,3)~=0);
         end
     end
     noteLenVari = size(noteAdd,1);
     %%------------------------------------------------
     inMeasureFix = pMeasure;
     timeInsert = 0;
     %inMeasureUse = 0;
     for noteAddloopIndex = 1 : noteLenVari
         %{
         if noteAddloopIndex > noteLenVari
             break
         end
         %}
         timeNow = noteAdd(noteAddloopIndex,1);
         if timeNow > selChMuta.measure(1,inMeasureFix).noteContent(end,1)
             inMeasureForward = fix(timeNow/maxMeasureLength);
             inMeasureForwardMod = mod(timeNow,maxMeasureLength);
             if inMeasureForwardMod == 0
                 inMeasureFix = inMeasureForward;
             else
                 inMeasureFix = inMeasureForward + 1;
             end
             %timeNow = mod(timeNow,maxMeasureLength);
             %%
             %{
             noteAddIndex = mod(noteAdd(noteAddloopIndex,1),maxMeasureLength);
             if noteAddIndex == 0
                 noteAddIndex = maxMeasureLength;
                 timeNow = maxMeasureLength;
             end
             noteAdd(noteAddloopIndex,1) = noteAddIndex;
             %}
             %%
             %inMeasureUse = 1;
         end
         timeNowIndexs = find(selChMuta.measure(1,inMeasureFix).noteContent(:,1) == timeNow);
         timeNowIndexs(:,2) = selChMuta.measure(1,inMeasureFix).noteContent(timeNowIndexs(:,1),5);
         IndexAlreadyNote = find(timeNowIndexs(:,2) == noteAdd(noteAddloopIndex,5));
         %% got the timeslide info for we insert node
         if isempty(IndexAlreadyNote) == 0
             %{
             nowTimeNoteIndex = timeNowIndexs(IndexAlreadyNote(1,1),1);
             if noteAdd(noteAddloopIndex,3) ~= 0
                 if selChMuta.measure(1,inMeasureFix).noteContent(nowTimeNoteIndex,3) == 0
                     %{
                 inMeasureFix ~= pMeasure &&
                 if noteAdd(noteAddloopIndex,3) == 0
                 else
                     noteAdd(noteAddloopIndex,3) =  noteAddloopIndex;
                 end
                 noteLenVari = noteAddloopIndex;
                     %}
                     %noteAddIndexs(nowTimeNoteIndex,:) = [];
                 end
             else
             end
             %}
             selChMuta.measure(1,inMeasureFix).noteContent(timeNowIndexs(IndexAlreadyNote(1,1),1),:) = noteAdd(noteAddloopIndex,:);
             multiIndexAlreadyNote = size(IndexAlreadyNote,1);
             if multiIndexAlreadyNote > 1
                 selChMuta.measure(1,inMeasureFix).noteContent(timeNowIndexs(IndexAlreadyNote(2:end,1),1),:) = [];
                 %{
                 if inMeasureUse ~= 1
                     TimeOfNoteAddIndexs(:,1) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(noteAddIndexs(:,1),1);
                     TimeOfNoteAddIndexs(:,2) = noteAddIndexs(:,1);
                     %for i = 2 : multiIndexAlreadyNote
                         %Now = timeNowIndexs(IndexAlreadyNote(i,1),1);
                         %NowOfSame = find(TimeOfNoteAddIndexs(:,2) == Now,1);
                         %TimeOfNoteAddIndexs(NowOfSame,:) = [];
                         %noteAddIndexs(NowOfSame,:) = [];
                         %endOfSame = find(TimeOfNoteAddIndexs(:,2) > Now,1);
                         %noteAddIndexs(endOfSame : end,1) = noteAddIndexs(endOfSame : end,1) - 1;
                     %end
                 end
                 %}
             end
             %sizeOfNoteAddIndexs = size(noteAddIndexs,1);
         else
             timeInsert = timeNowIndexs(end,1);
             %% first part is above of noteAdd
             tempFromStart = selChMuta.measure(1,inMeasureFix).noteContent(1: timeInsert,:);
             %% second part is belowd of noteAdd
             % one of +1 is noteAdd
             tempFromInserted = selChMuta.measure(1,inMeasureFix).noteContent(timeInsert + 1 : end,:);
             %{
             if inMeasureUse ~= 1
                 %%
                 %TimeOfNoteAddIndexs(:,1) = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(noteAddIndexs(:,1),1);
                 %TimeOfNoteAddIndexs(:,2) = noteAddIndexs(:,1);
                 %Now = gaDat.chromsome(1,IndicesMutaChoice).measure(1,inMeasureFix).noteContent(noteAddIndexs(nAIndex,1),1);
                 %Now = timeInsert;
                 %endOfSame = find(TimeOfNoteAddIndexs(:,2) > Now,1);
                 %noteAddIndexs(endOfSame : end,1) = noteAddIndexs(endOfSame : end,1) + 1;
             end
             %}
             selChMuta.measure(1,inMeasureFix).noteContent = [tempFromStart ; noteAdd(noteAddloopIndex,:) ; tempFromInserted];
         end
         %% if notesAdd got the new start note , added to indexNotDo pool ,prevent already mutated note then muta again.
         if noteAdd(noteAddloopIndex,3) ~= 0
             if timeInsert~=0
                 noteAddCreateNotDoNonZeroIndex = find(noteAddCreateNotDo(1,:) == 0,1);
                 noteAddCreateNotDo(1,noteAddCreateNotDoNonZeroIndex) = timeInsert+1;
                 timeInsert = 0;
             end
         end
         %%{ 
         %% check the index is work perfect
         noteAddIndexs = find(selChMuta.measure(1,pMeasure).noteContent(:,3)~=0);
         sizeOfNoteAddIndexs = size(noteAddIndexs,1);
         checkNoteAddIndexs = find(selChMuta.measure(1,pMeasure).noteContent(:,3)~=0);
         IndexMap =  find((checkNoteAddIndexs == noteAddIndexs)==1);
         sizeIndexMap = size(IndexMap,1);
         sizeCheckNoteAddIndexs = size(checkNoteAddIndexs,1);
         if sizeCheckNoteAddIndexs ~= sizeIndexMap
             disp('indexerror');
         end
         %}
         
         inMeasureFix = pMeasure;
         %inMeasureUse = 0;
     end
 end