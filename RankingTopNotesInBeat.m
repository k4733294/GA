function notesRank = RankingTopNotesInBeat(notesRank,sizeM,sizeB)

notesRankContentInBeat = notesRank.measre(1,sizeM).beat(1,sizeB).rank;

%% sortByLength
sortByLength = sortrows(notesRankContentInBeat,-2);
notesRank.measre(1,sizeM).beat(1,sizeB).rankByLength= sortByLength;
%% sortByPitch
sortByPitch = sortrows(notesRankContentInBeat,1);
notesRank.measre(1,sizeM).beat(1,sizeB).rankByPitch= sortByPitch;



%{
b = sortrows(notesRankContentInBeat,-2);
c = sortrows(notesRankContentInBeat,-1);
d = sortrows(notesRankContentInBeat,[-1 -2]);
e = sortrows(notesRankContentInBeat,[-2 -1]);
%}