function NewMeloPath = CreateNewFolderForMeloChrom(gaDat)

midiString = gaDat.mainImportInfo.midiString;
midiStringSplit = strsplit(midiString,'.');
MeloTitle = midiStringSplit(1,1);
meloVersion = gaDat.mainImportInfo.version;
NewMeloPath= strcat(pwd,'/GA/GA_result/',MeloTitle,'_',meloVersion,'/');
if exist(NewMeloPath,'dir')==0
disp('chromCrateSampleFolder NotExist Then Create new one');
disp(NewMeloPath);
mkdir(NewMeloPath);
else
disp('chromCrateSampleFolder Exist Then Donothing');    
disp(NewMeloPath);
end