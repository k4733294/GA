%% ///algorithm conf////
gaDat = gaInitConf();
%%  ////main melody import/////
gaDat = MainMelodyImport(gaDat);
%%  ////sample import/////
gaDat = ChordImport(gaDat);
%%  ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 
