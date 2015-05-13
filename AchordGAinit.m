%%  ////main melody import/////
gaDat = MainMelodyImport();
%%  ////sample import/////
gaDat = ChordImport(gaDat);
%%  ////default import/////
gaDat = DefaultImport(gaDat);
%% ///algorithm conf//// 
%some conf var get from MainMelodyImport
gaDat = GaInitConf(gaDat);
%%  ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 
