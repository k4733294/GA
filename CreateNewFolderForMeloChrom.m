function NewMeloPath = CreateNewFolderForMeloChrom(gaDat)

midiString = gaDat.mainImportInfo.midiString;
midiStringSplit = strsplit(midiString,'.');
MeloTitle = midiStringSplit(1,1);
meloVersion = gaDat.mainImportInfo.version;

prevPath = strcat(pwd,'/GA/GA_result/');
currentPath = strcat(MeloTitle,'_',meloVersion,'/');
NewMeloPath = strcat(pwd,'/GA/GA_result/',MeloTitle,'_',meloVersion,'/');

if exist(NewMeloPath{1},'dir')==0
disp('chromCrateSampleFolder NotExist Then Create new one');
disp(NewMeloPath{1});
mkdir(prevPath,currentPath{1});
else
disp('chromCrateSampleFolder Exist Then Donothing');    
disp(NewMeloPath{1});
end
a=1;