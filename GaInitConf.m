function gaDat = GaInitConf(gaDat,osSys)

gaVersion = 'ver2000_pm0.1_gaBedore';
gaVersionFinish = 'ver2000_pm0.1_gaFinish';
gaDat.Objfun='Objfunchordfit';
%% //////adjust///////////
%the population pool
gaDat.populationSize = 150;
%how many time will generate
gaDat.MAXGEN = 2000;
%tonal means : major note  default  65F 64E 62D 60C 59B 57A 55G
%%OsSystem is
gaDat.osSysNow = osSys;
newMeloPathBefore = CreateNewFolderForMeloChrom(gaDat,gaVersion);
newMeloPathFinish = CreateNewFolderForMeloChrom(gaDat,gaVersionFinish);
gaDat.newMeloPathBefore = newMeloPathBefore;
gaDat.newMeloPathFinish = newMeloPathFinish;

%% createmeasureLengthNoteNum total length of the chrosome  is the same length with others
% ATTATION --- here we need to change the evalute variable
%gaDat.NIND = numel(gaDat.mainImportInfo.notesInTheMeasure);
%% evaluation in the ranking function
gaDat.rf = (1:gaDat.populationSize)';
gaDat.dialogLength = 16;
gaDat.patternLength = 4;
gaDat.Pm={0.1};

%% export mainMeloImportInfo
%trackTitle = strcat(gaDat.mainImportInfo.trackName,newMeloPathBefore);
%gaDat.mainImportInfo.exportVersion = trackTitle;
trackTitle = strcat(newMeloPathBefore,gaDat.mainImportInfo.trackName);
gaDat.mainImportInfo.trackTitle = trackTitle;
Melodyexport(gaDat.mainImportInfo,trackTitle{1});

%% export chordImportInfo
sizeOfChordImportInfo = size(gaDat.chordImportInfo,2);
for chordImportNum = 1 : sizeOfChordImportInfo
trackTitle = strcat(newMeloPathBefore,gaDat.chordImportInfo(chordImportNum).exportVersion);
Melodyexport(gaDat.chordImportInfo(chordImportNum),trackTitle{1});
end

%%export defaultImport
sizeOfDefaultImportInfo = size(gaDat.defaultImportInfo,2);
for defaultImportNum = 1 : sizeOfDefaultImportInfo
trackTitle = strcat(newMeloPathBefore,gaDat.defaultImportInfo(defaultImportNum).exportVersion);
Melodyexport(gaDat.defaultImportInfo(defaultImportNum),trackTitle{1});
end


