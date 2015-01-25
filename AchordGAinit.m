%%  ////main melody import/////
gaDat = MainMelodyImport();
%% ///algorithm conf//// 
%some conf var get from MainMelodyImport
gaDat = GaInitConf(gaDat);
%%  ////sample import/////
gaDat = ChordImport(gaDat);
%%  ////default import/////
gaDat = DefaultImport(gaDat);
%%  ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 
