function notesRank = RankingTopNotesInBeat(notesRank,sizeM,sizeB)

notesRankContentInBeat = notesRank.measre(1,sizeM).beat(1,sizeB).rank;

%% sortByLength
sortByLength = sort(notesRankContentInBeat(:,2),'descend');
notesRank.measre(1,sizeM).beat(1,sizeB).rankByLength= sortByLength;
%% sortByPitch
sortByPitch = sort(notesRankContentInBeat(:,1),'descend');
notesRank.measre(1,sizeM).beat(1,sizeB).rankByPitch= sortByPitch;
