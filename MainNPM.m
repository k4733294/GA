function  notesRank = MainNPM(gaDat)

sizeM = size(gaDat.mainImportInfo.measure,2);
%%
%loop measure
for i = 1 : sizeM
   sizeB = size(gaDat.mainImportInfo.measure(1,i).beat,2);
   %loop beat
   for j = 1 : sizeB
       notesRank.measre(1,i).beat(1,j).rank = zeros(100,2);   
       notesRankContentInBeat = notesRank.measre(1,i).beat(1,j).rank;
       notesNonSort = gaDat.mainImportInfo.measure(1,i).beat(1,j).noteContent;
       sizeNInBar = size(notesNonSort,1);
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
       notesRank.measre(1,i).beat(1,j).rank = EmptyItemFilter(notesRankContentInBeat);
       %% sort the notesRank here
       notesRank = RankingTopNotesInBeat(notesRank,i,j);
   end

end