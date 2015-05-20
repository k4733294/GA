function MultiMainMelodyTester()

%%  ////main melody import/////
gaDat = MainMelodyImport(whichMalodyImport);
%%  ////sample import/////
gaDat = ChordImport(gaDat);
%%  ////default import/////
gaDat = DefaultImport(gaDat);
%% ///algorithm conf//// 
%some conf var get from MainMelodyImport
gaDat = GaInitConf(gaDat);
%%  ////Execute GA/////
gaDat = Crtrp(gaDat);
clearvars gaDat


