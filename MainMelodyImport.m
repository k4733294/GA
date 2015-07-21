function gaDat = MainMelodyImport(whichMalodyImport)

%% ////mainMelodyimport////
switch whichMalodyImport
    %% mainmelody create to GADat , make the ga caculating
    %%{
    case 1
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
        %%{
    case 2
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
        %%{
    case 3
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
        %%{
    case 4
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
        %%{
    case 5
        mainImportInfo.Objfun='mainMelody';
        mainImportInfo.midiString = 'Wiz Khalifa-See_You_Again_feat._Charlie_Puth_wo_Chord_logicFormat.mid';
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
        %%{
    case 6
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
        %%{
    case 7
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
        %%{
    case 8
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
        %%{
    case 9
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
        %%{
    case 10
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
        %%{
    case 11
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
        mainImportInfo.chorusPoint = [18 ,21];
        mainImportInfo.trackName = 'main_idina_menzel-let_it_go_Vocal_Output';
        %}
        %%{
    case 12
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
        mainImportInfo.chorusPoint = [18 ,21];
        mainImportInfo.trackName = 'main_idina_menzel-let_it_go_Chord_Output';
        %}
        %%{
    case 13
        mainImportInfo.Objfun='mainMelody';
        mainImportInfo.midiString = 'c-rpg_Vocal_LogicFormatFix.mid';
        mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
        mainImportInfo.track=1;
        mainImportInfo.howManyMeasureWeWant=252;
        mainImportInfo.whichMeasureWeStart=1;
        mainImportInfo.rhythm=1;
        mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
        mainImportInfo.cosDenominator=4;
        mainImportInfo.cosNumerator=4;
        mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
        mainImportInfo.cosTonal(1,1)=-1;
        mainImportInfo.cosTonal(2,1)=0;
        mainImportInfo.chordLength=2; %how many beat of chord
        mainImportInfo.chorusPoint = [35 ,58];
        mainImportInfo.trackName = 'main_c-rpg_Vocal_Output';
        %}
             %%{
    case 14
        mainImportInfo.Objfun='mainMelody';
        mainImportInfo.midiString = 'Cyndi Lauper-Time After Time.mid';
        mainImportInfo.mainOrChord=1; % 0 = main melody 1=import chord melody
        mainImportInfo.track=1;
        mainImportInfo.howManyMeasureWeWant=140;
        mainImportInfo.whichMeasureWeStart=1;
        mainImportInfo.rhythm=1;
        mainImportInfo.forcecosDeNu = 1; %%force use the cosDenominator cosNumerator 1 = true
        mainImportInfo.cosDenominator=4;
        mainImportInfo.cosNumerator=4;
        mainImportInfo.forcecosTonal = 1; %%force use the cosTonal 1 = true
        mainImportInfo.cosTonal(1,1)= 1;
        mainImportInfo.cosTonal(2,1)= 0;
        mainImportInfo.chordLength=2; %how many beat of chord
        mainImportInfo.chorusPoint = [10,22];
        mainImportInfo.trackName = 'main_Cyndi Lauper-Time After Time_Output';
        %}
        
        
end
mainImportInfo = Variabledefine(mainImportInfo,1);
 gaDat.mainImportInfo=mainImportInfo;
 