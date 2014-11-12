% ////main melody import/////
gaDat = MainMelodyImport();
% ////sample import/////
gaDat = ChordImport(gaDat);
% ////Execute GA/////
gaDat = Ga(gaDat);
% Result are 