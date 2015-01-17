function gaDat = MainMelodyImport()

%% ////mainMelodyimport////
%% mainmelody create to GADat , make the ga caculating
%{
mainImportInfo.Objfun = 'mainMelody';
mainImportInfo.midiString = 'pitbull-timber_ft_kesha.mid';
mainImportInfo.mainOrChord = 0; % 0 = main melody 1= import chord melody
mainImportInfo.track = 6;
mainImportInfo.howManyMeasureWeWant = 8;
mainImportInfo.whichMeasureWeStart = 3;
mainImportInfo.rhythm = 1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 0; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=1;
mainImportInfo.cosTonal(2,1)=1;
version = 'pitbull-timber_Output';
mainImportInfo.exportVersion=version;
mainImportInfo = Variabledefine(mainImportInfo,mainImportInfo.rhythm);
Melodyexport(mainImportInfo,version);
%}
%except added  have some error here so i try another way to import 
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'avicii-the_days_ft_robbie_williams.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=3;
%{
mainImportInfo.howManyMeasureWeWant=16;
mainImportInfo.whichMeasureWeStart=80;
%}
mainImportInfo.howManyMeasureWeWant=64;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=1;
mainImportInfo.cosTonal(2,1)=1;
version = 'main_avicii-the_days_ft_robbie_williams_Output';
mainImportInfo.exportVersion=version;
mainImportInfo = Variabledefine(mainImportInfo,mainImportInfo.rhythm);
Melodyexport(mainImportInfo,version);
%}
gaDat.mainImportInfo=mainImportInfo;