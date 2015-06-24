%%  ////main melody import/////

%% fix chord deault import tempraly error
%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDatRollingInTheDeepNoStructFixAllnote.mat');
load('C:\Users\lab1421\Documents\MATLAB\GA\struct_data\gaDatRollingInTheDeepNoStructFixAllnote.mat');
chordImportInfo = gaDat.chordImportInfo;
defaultImportInfo = gaDat.defaultImportInfo;
clearvars gaDat
%% ///algorithm conf//// 
%some conf var get from MainMelodyImport
gaDat = GaInitConf();
%%
whichMalodyImport = 11;
gaDat = MainMelodyImport(whichMalodyImport,gaDat);
%%  ////sample import/////
%gaDat = ChordImport(gaDat);
gaDat.chordImportInfo = chordImportInfo;
%%  ////default import/////
%gaDat = DefaultImport(gaDat);
gaDat.defaultImportInfo = defaultImportInfo;
%%  ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 
