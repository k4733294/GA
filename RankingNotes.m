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
   sizeB = size(gaDat.mainImportInfo.measure(1,i).beat,2);
   %loop beat
   for j = 1 : sizeB
       notesRank.measre(1,i).beat(1,j).rank = zeros(100,2);   
       notesRankContentInBeat = notesRank.measre(1,i).beat(1,j).rank;
       notesNonSort = gaDat.mainImportInfo.measure(1,i).beat(1,j).noteContent;
       sizeNInBar = size(notesNonSort,1);
       %loop note
       for k = i : sizeNInBar
           %do not any empty notes -1
           if notesNonSort(k,5) ~= -1
            notesPiorityCount = find(notesRankContentInBeat==notesNonSort(k,5),1);
            %%fine does any notes rank already write down the notesRankContentInBeat
                if isempty(notesPiorityCount) == true
                    %% No we need to create the new notes at notesRankContentInBeat next the empty position
                    pFirstEmptyNotesRankContentInBeat=find(notesRankContentInBeat(:,1)==0,1,'first');
                    notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,1) = notesNonSort(k,5);
                    %then make this note plus 1 cuz appeard once now
                    plus1 = notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) + 1;
                    notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) = plus1;
                else
                    %% yes , we already have the note at notesRankContentInBeat and find the position about it
                    pFirstEmptyNotesRankContentInBeat=find(notesRankContentInBeat(:,1)==notesNonSort(k,5),1,'first');
                    %then make this note plus 1 cuz appeard once now
                    plus1 = notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) + 1;
                    notesRankContentInBeat(pFirstEmptyNotesRankContentInBeat,2) = plus1;
                end
           end
       end
       %% filter the element empty which we do not need it
       temp = notesRankContentInBeat;
       totalRow=find(notesRankContentInBeat(:,1) ,1,'last' );
       notesRankContentInBeat = temp(1:totalRow,:);
       notesRank.measre(1,i).beat(1,j).rank = notesRankContentInBeat;
       %% sort the notesRank here
       notesRank = RankingTopNotesInBeat(notesRank,i,j);
   end
end
a=1;