function AchordGAinit(whichMalodyImport)
%%  ////main melody import/////

%% fix chord deault import tempraly error
osSys = ismac;
if osSys == 1
    load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDatRollingInTheDeepNoStructFixAllnote.mat');
else
    load('C:\Users\lab1421\Documents\MATLAB\GA\struct_data\gaDatRollingInTheDeepNoStructFixAllnote.mat');
end
chordImportInfo = gaDat.chordImportInfo;
defaultImportInfo = gaDat.defaultImportInfo;
clearvars gaDat
%% ////MainMelody Import
gaDat = MainMelodyImport(whichMalodyImport);
%%  ////sample Import/////
%gaDat = ChordImport(gaDat);
gaDat.chordImportInfo = chordImportInfo;
%%  ////default Import/////
%gaDat = DefaultImport(gaDat);
gaDat.defaultImportInfo = defaultImportInfo;
%% ///algorithm conf//// 
%some conf var get from MainMelodyImport
gaDat = GaInitConf(gaDat,osSys);
%%  ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 
