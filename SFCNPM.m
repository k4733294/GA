function notesRank = SFCNPM(importStruct,chordLength,pBeat)
 
%%loop extend notes in the chord length(flexible) 
notesNonSort = [];
for i = pBeat:pBeat+chordLength-1
    notesNonSort = [ notesNonSort ; importStruct(1,1).beat(1,i).noteContent ];
end
sizeNInBar = size(notesNonSort,1);
%loop beat
notesRank.beat(1,pBeat).rank = zeros(200,2);   
notesRankContentInBeat = notesRank.beat(1,pBeat).rank;
%loop note
for k = 1 : sizeNInBar
  %do not any empty notes -1
   if notesNonSort(k,5) ~= -1
    notesPiorityCount = find(notesRankContentInBeat == notesNonSort(k,5),1);
    %%find does any notes rank already write down the notesRankContentInBeat
        if isempty(notesPiorityCount) == true
            %% No we need to create the new notes at notesRankContentInBeat next the empty position
            pFirstEmptyNotesRankContentInBeat=find(notesRankContentInBeat(:,1) == 0,1,'first');
            notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,1) = notesNonSort(k,5);
            %then make this note plus 1 cuz appeard once now
            plus1 = notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) + 1;
            notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) = plus1;
            %give the note divided we got Quotient & Remainder
            %represent the octative and pitch
            %Quotient means octative 
            notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,3) = fix(notesNonSort(k,5)/12);
            %Remainder means pitch
            notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,4) = mod(notesNonSort(k,5),12);
        else
            %% yes , we already have the note at notesRankContentInBeat and find the position about it
            pFirstEmptyNotesRankContentInBeat=find(notesRankContentInBeat(:,1) == notesNonSort(k,5),1,'first');
            %then make this note plus 1 cuz appeard once now
            plus1 = notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) + 1;
            notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) = plus1;
        end
   end
end
%% filter the element empty which we do not need it
notesRank.beat(1,pBeat).rank = EmptyItemFilter(notesRankContentInBeat);
