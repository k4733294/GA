function notesRank = RankingNotes(gaDat)

%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDat.mat');
%{
gaDat.chordImportInfo(1,sampleNumChoice).measure(1,pMeasure).beat(1,1).noteContent
samplePropertiesChoice;
sampleNumChoice;
sampleFrameChoice;
gaDat.mainImportInfo.measure(1,pMeasure).beat(1,pBeat).noteContent;
%}
sizeM = size(gaDat.mainImportInfo.measure,2);
%%
%loop measure
for i = 1 : sizeM
   sizeB = size(gaDat.mainImportInfo.measure(1:sizeM).beat,2);
   %loop beat
   for j = 1 : sizeB
       notesRank.measre(1,sizeM).beat(1,sizeB).rank = zeros(100,3);   
       notesRankContentInBeat = notesRank.measre(1,sizeM).beat(1,sizeB).rank;
       notesNonSort = gaDat.mainImportInfo.measure(1,sizeM).beat(1,sizeB).noteContent;
       sizeNInBar = size(notesNonSort,1);
       %loop note
       for k = i : sizeNInBar
       notesPiorityCount = find(notesRankContentInBeat==notesNonSort(k,4),1);
            %%fine does any notes rank already write down the notesRankContentInBeat
            if isempty(notesPiorityCount) == true
                %% No we need to create the new notes at notesRankContentInBeat next the empty position
                pFirstEmptyNotesRankContentInBeat=find(notesRankContentInBeat(:,1)==0,first);
                notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,1) = notesNonSort(k,4);
                %then make this note plus 1 cuz appeard once now
                plus1 = notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) + 1;
                notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) = plus1;
            else
                %% yes , we already have the note at notesRankContentInBeat and find the position about it
                pFirstEmptyNotesRankContentInBeat=find(notesRankContentInBeat(:,1)==notesNonSort(k,4),first);
                %then make this note plus 1 cuz appeard once now
                plus1 = notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) + 1;
                notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) = plus1;
            end
       end
       %% filter the element empty which we do not need it
       temp = notesRankContentInBeat;
       totalRow=find(notesRankContentInBeat(:,1) ,1,'last' );
       notesRankContentInBeat = zeros(totalRow,6);
       notesRankContentInBeat = temp(1:totalRow,:);
       notesRank.measre(1,sizeM).beat(1,sizeB).rank = notesRankContentInBeat;
       %% sort the notesRank here
       notesRank = RankingTopNotesInBeat(notesRank,sizeM,sizeB);
   end
end