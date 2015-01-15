function sampleNumChoice = SPC(gaDat,samplePropertiesChoice)

if samplePropertiesChoice == 0
 %%import sample beat choice 
 numsImportInfo = size(gaDat.chordImportInfo,2);
else
 %%default sample beat choice
 numsImportInfo = size(gaDat.defaultImportInfo,2);
end
sampleNumChoice = randi([1 numsImportInfo]);