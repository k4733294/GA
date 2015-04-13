function gaDat = ChangeImportTonal(gaDat)
endOfii = size(gaDat.chordImportInfo,2);
for i = 1 : endOfii
    MtonalEqual = gaDat.mainImportInfo(1,1).tonal;
    CtonalEqual = gaDat.chordImportInfo(1,i).tonal;
    if ((MtonalEqual(1,1) == CtonalEqual(1,1))&&(MtonalEqual(2,1) == CtonalEqual(2,1)))
        %do not use Transportmeasure to the same tonal
    else
        mainImportInfo = gaDat.mainImportInfo(1,1);
        notesInTheMeasure = Transportmeasure(mainImportInfo,gaDat.chordImportInfo(1,i));
        gaDat.chordImportInfo(1,i).notesInTheMeasure = notesInTheMeasure;
    end
end
endOfii = size(gaDat.defaultImportInfo,2);
for j = 1 : endOfii
    MtonalEqual = gaDat.mainImportInfo(1,1).tonal;
    CtonalEqual = gaDat.defaultImportInfo(1,j).tonal;
    if ((MtonalEqual(1,1) == CtonalEqual(1,1))&&(MtonalEqual(2,1) == CtonalEqual(2,1)))
        %do not use Transportmeasure to the same tonal
    else
        mainImportInfo = gaDat.mainImportInfo(1,1);
        notesInTheMeasure = Transportmeasure(mainImportInfo,gaDat.defaultImportInfo(1,j));
        gaDat.defaultImportInfo(1,j).notesInTheMeasure = notesInTheMeasure;
    end
end