function  pNoteInMA = MainNoteAlphabetFix(musicalAlphabet,PNoteInMAIndex,tonal)
    if tonal(2,1) ~= 0 %minor
       if PNoteInMAIndex == 11
            pNoteInMA = musicalAlphabet(1,PNoteInMAIndex-1);
        else
            pNoteInMA = musicalAlphabet(1,PNoteInMAIndex+1);
        end
    else %major
       pNoteInMA = musicalAlphabet(1,PNoteInMAIndex+1);
    end