%%  ////main melody import/////
gaDat = MainMelodyImport();
%% ///algorithm conf//// 
%some conf var get from MainMelodyImport
gaDat = gaInitConf(gaDat);
%%  ////sample import/////
gaDat = ChordImport(gaDat);
%%  ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 
