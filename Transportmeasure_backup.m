function notesInTheMeasure = Transportmeasure_backup(mainImportInfo,chordImportInfo)
%% give the tonal 
%the rule is
%                          1 2  3    4   5  6     *7     
%                        'C','G','D', 'A', 'E','B',  *'F#'
%                        -1 -2  -3   -4   -5   -6    
%                       'F','Bb','Eb','Ab','Db','Gb'
%                               major *1  minor*2   
%% here i must translate the tonal matrix to this present that i can
%%use this struct in major minor selection in trans judgment  at  ex:49~55  
%MIT = mainImportInfo.tonal;
%CIT= chordImportInfo.tonal;
major =1; minor = 2;
if mainImportInfo.tonal(2,1) == 0
    MIT = major;
else
    MIT = minor;
end
if chordImportInfo.tonal(2,1) == 0
    CIT = major;
else
    CIT = minor;
end
%%notesInTheMeasure in chordimoort we need to trans
notesInTheMeasure = chordImportInfo.notesInTheMeasure;
%%some infoi init
iMTNoteMean = [];
compareMT=0;
%% tonaltranswheel structure we need to use later
%                  c    d    e     f g     a      b
modWheel=[0 1 2 3 4 5 6 7 8 9 10 11];
                    
%%tonal meaning maping
tonalMajorWheel = [-6 -5 -4 -3 -2 -1 1 2 3 4 5 6]; % -6 = 7 F# =Gb
tonalMinorWheel = [-3 -2 -1 1 2 3 4 5 6 -6 -5 -4];

%%note meaning maping
tonalMajorWheelMod = [6 1 8 3 10 5 0 7 2 9 4 11]; %pitch mod 12
tonalMinorWheelMod = [3 10 5 0 7 2 9 4 11 6 1 8];

%% PartA----------------------------------------------------------
%SET the mainMeasure Infomation about tonal direction in cycle
%IS major or minor
%ATTATION!!!!!!! we can set  the higher layer funtion then here
if (MIT == 1) %is major
    indexMMT = find(tonalMajorWheel == mainImportInfo.tonal(1,1));  
else 
    indexMMT = find(tonalMinorWheel == mainImportInfo.tonal(1,1));
end
%% PartB----------------------------------------------------------
%% anlysis importMeasure is minor or major and find index in tonal"M/m"Whell
if (CIT == 1) %Is major
    indexIMT = find(tonalMajorWheel == chordImportInfo.tonal(1,1));
else 
    %make minor finding the content from minor tonal
    indexIMT = find(tonalMinorWheel == chordImportInfo.tonal(1,1));
end
%% give the meaning into measure tonal like in Maintonal
% major c with  c  d   e   f   g  a    b   
%                        I II III VI V VI VII
%note meaning maping
%%{
startIMTIndex = 0;
if  (MIT == 1)
    startIMTIndex= find(modWheel == tonalMajorWheelMod(1,indexMMT),1,'first');
else
    startIMTIndex= find(modWheel == tonalMinorWheelMod(1,indexMMT),1,'first');
end
iMTNoteMean = zeros(1,12);
startIMTIndexReset = startIMTIndex - 1;
for i = 1 : 12
     %reloop the notes mod in to a cycle like c d e f g a b 'c'
    startIMTIndex = startIMTIndexReset + i;
    if (startIMTIndex > 12)
        startIMTIndex = startIMTIndex - 11 ;
    end
    iMTNoteMean(1,i) = modWheel(1,startIMTIndex);
end
%}
%% present major or minor note meaning here
%% we focus on the two tonal direction and way
% if the anthor way is short ,so we path another way 
%that must minus12 and give plus or minus diffrent then before
%compareMT  " + " is  plus5 refrence in tranpose " - " is  mius5 refrence in tranpose 
compareMT = indexMMT - indexIMT;
compareMTabs = abs(compareMT);
compareMTa = 12 - compareMTabs;

%% try to know which path in cycle is short
if compareMTabs > compareMTa
    %if the another way is short so we change it
    if compareMT<0
        %give different way meaning  + to -    -  to +
        compareMT = compareMTa;
    else
        compareMT = -compareMTa;
    end
else
    %compare MT is short, so we donothing
end

%% rule of 7semitone progress cycle
compareMT = 7*compareMT;
        
%% know the import tonal mesare is minor or not
%cuz major is have 3 semitone distance with minor
if MIT ~= CIT
    if MIT == 1
        compareMT = compareMT + 3; % minor to major
    else
        compareMT=compareMT - 3; % major to minor
    end
else
    %do nothing
end

%% START translate every note
%%need to fix the notesInTheMeasure(i,7) notesInTheMeasure(i,8) meaning
%%here
sizeNITM = size(notesInTheMeasure,1);
for i = 1 : sizeNITM
    %FORpartB----------------------------------------------------------
        tranNow=(notesInTheMeasure(i,5)+compareMT);
        tranNow=mod(tranNow,12);
        %move untransNote to 8 col
        notesInTheMeasure(i,8) = notesInTheMeasure(i,5);
        %changed Note at 5 col
        notesInTheMeasure(i,5)=notesInTheMeasure(i,4)*12+tranNow;
     %FORpartA----------------------------------------------------------
        modNITM=mod(notesInTheMeasure(i,5),12);
        %notesInTheMeasure(i,7) = find(iMTNoteMean==modNITM);
        notesInTheMeasure(i,7) = modNITM;
end
a=1;