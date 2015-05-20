function gaDat = MainMelodyImport(whichMalodyImport)


%% ////mainMelodyimport////
mainImportInfo.version = 'ver1';
%% mainmelody create to GADat , make the ga caculating
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'adele-rolling_in_the_deep_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=128;
mainImportInfo.whichMeasureWeStart = 1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=1;
mainImportInfo.cosTonal(2,1)=1;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [24,32];% which is mainMelody sub(chorus) MelodyStart [Start,End]
mainImportInfo.trackName = 'main_adele-rolling_in_the_deep_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'john_legend-all_of_me_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=128;
mainImportInfo.whichMeasureWeStart = 1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=1;
mainImportInfo.cosTonal(2,1)=1;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [25,32];% which is mainMelody sub(chorus) MelodyStart [Start,End]
mainImportInfo.trackName = 'main_john_legend-all_of_me_Output';
%}
%{
%except added  have some error here so i try another way to import 
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'avicii-the_days_ft_robbie_williams.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=3;
mainImportInfo.howManyMeasureWeWant=128;
mainImportInfo.whichMeasureWeStart=28;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=1;
mainImportInfo.cosTonal(2,1)=0;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [22,32];
mainImportInfo.trackName = 'main_avicii-the_days_ft_robbie_williams_Output';
%}
%--------new added not tested
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'magic-rude_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=168;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=-5;
mainImportInfo.cosTonal(2,1)=0;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [25 ,42];
mainImportInfo.trackName = 'main_magic-rude_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'Wiz Khalifa-See_You_Again_feat._Charlie_Puth_w:o_Chord_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=152;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=-2;
mainImportInfo.cosTonal(2,1)=0;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [14 ,26];
mainImportInfo.trackName = 'main_Wiz Khalifa - See You Again feat. Charlie Puth_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'psycho_pass-namae_no_nai_kaibutsu_wo_Chord.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=120;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=-3;
mainImportInfo.cosTonal(2,1)=0;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [21 ,30];
mainImportInfo.trackName = 'main_psycho-pass-namae-no-nai-kaibutsu_wo_Chord_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'YouAreTheEyesOfMe_wo_Chord.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=144;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=1;
mainImportInfo.cosTonal(2,1)=0;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [28 ,36];
mainImportInfo.trackName = 'main_YouAreTheEyesOfMe_wo_Chord_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'sugar_-_maroon_5_(arr._by_fonzi_m)_wo_Chord.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=96;
mainImportInfo.whichMeasureWeStart=24;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=-5;
mainImportInfo.cosTonal(2,1)=0;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [17 ,24];
mainImportInfo.trackName = 'main_sugar_-_maroon_5_(arr._by_fonzi_m)_wo_Chord_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'eagles-hotel_california_vocal_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=192;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=5;
mainImportInfo.cosTonal(2,1)=1;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [33,47];
mainImportInfo.trackName = 'main_eagles-hotel_california_Vocal_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'eagles-hotel_california_chord_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=192;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=5;
mainImportInfo.cosTonal(2,1)=1;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [33 ,47];
mainImportInfo.trackName = 'main_eagles-hotel_california_Chord_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'idina_menzel-let_it_go_vocal_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=84;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=-1;
mainImportInfo.cosTonal(2,1)=1;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [18 ,25];
mainImportInfo.trackName = 'main_idina_menzel-let_it_go_Vocal_Output';
%}
%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'idina_menzel-let_it_go_chord_logicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=84;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=-1;
mainImportInfo.cosTonal(2,1)=1;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [18 ,25];
mainImportInfo.trackName = 'main_idina_menzel-let_it_go_Chord_Output';
%}
%%{
mainImportInfo.Objfun='mainMelody';
mainImportInfo.midiString = 'c-rpg_Vocal_LogicFormat.mid';
mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
mainImportInfo.track=1;
mainImportInfo.howManyMeasureWeWant=256;
mainImportInfo.whichMeasureWeStart=1;
mainImportInfo.rhythm=1;
mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
mainImportInfo.cosDenominator=4;
mainImportInfo.cosNumerator=4;
mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
mainImportInfo.cosTonal(1,1)=-1;
mainImportInfo.cosTonal(2,1)=1;
mainImportInfo.chordLength=2; %how many beat of chord
mainImportInfo.chorusPoint = [35 ,58];
mainImportInfo.trackName = 'main_c-rpg_Vocal_Output';
%}
mainImportInfo = Variabledefine(mainImportInfo,1);
trackTitle = strcat(mainImportInfo.trackName,mainImportInfo.version);
mainImportInfo.exportVersion=trackTitle;
trackTitle = strcat(pwd,'/GA/GA_result/',trackTitle);
Melodyexport(mainImportInfo,trackTitle);
gaDat.mainImportInfo=mainImportInfo;