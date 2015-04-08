function  noteNeedTransPitch = NoteTrans(noteNeedTransMA,musicalAlphabet,musicalAlphabetExtend,BassNoteDistance)

%% A:: appeard noteNeedTransMA not
%     in standar musical alphabet
extendIndex = find(musicalAlphabetExtend(1,:) == noteNeedTransMA,1,'first');
if isempty(extendIndex)==0
    transExtendIndex = extendIndex + BassNoteDistance;
    if transExtendIndex > 0
        transExtendIndex= mod(transExtendIndex,5);
    else %transExtendIndex <=0
        %fix transExtendIndex to positive
        transExtendIndex = abs(transExtendIndex);
        %loop backword
        transExtendIndex = 5 - mod(transExtendIndex,5);
        %if transExtendIndex appeared 0 means
        %musicalAlphabetExtend backword to begin like
        %4 3 2 1 4 :: musicalAlphabetExtend                                           
        %4 3 2 1 0 :: transExtendIndex
    end
    if  transExtendIndex == 5
         transExtendIndex = 5;
    elseif transExtendIndex ==0
        transExtendIndex = 1;
    end
    noteNeedTransMA = musicalAlphabetExtend(1,transExtendIndex);
else
    %% B:: fix noteNeedTransMA+BassNoteDistance
    %     have situation  may big than 7
    noteNeedTransMA = noteNeedTransMA + BassNoteDistance;
    if noteNeedTransMA > 0
        noteNeedTransMA = mod(noteNeedTransMA,7);
    else
        noteNeedTransMA = abs(noteNeedTransMA);
        noteNeedTransMA = 7 - mod(noteNeedTransMA,7);
    end
     if  noteNeedTransMA == 7
        noteNeedTransMA = 7;
     elseif noteNeedTransMA ==0
         noteNeedTransMA = 1;
     end
end
%% trans noteNeedTransMA by musical alphabet to find new translated pitch 
     noteNeedTransMAIndex= find(musicalAlphabet(1,:) == noteNeedTransMA,1,'first');
     noteNeedTransPitch = musicalAlphabet(2,noteNeedTransMAIndex);

    