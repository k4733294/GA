%%  ////main melody import/////
gaDat = MainMelodyImport();
%% ///algorithm conf//// 
%some conf var get from MainMelodyImport
gaDat = GaInitConf(gaDat);
%%  ////sample import/////
gaDat = ChordImport(gaDat);
%%  ////default import/////
gaDat = defaultImport(gaDat);
%%  ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 
