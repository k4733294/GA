function notesInTheMeasure = Transportmeasure(mainImportInfo,chordImportInfo)
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
    MIT = mainImportInfo.tonal(1,1)*major;
else
    MIT = mainImportInfo.tonal(1,1)*minor;
end

if chordImportInfo.tonal(2,1) == 0
    CIT = chordImportInfo.tonal(1,1)*major;
else
    CIT = chordImportInfo.tonal(1,1)*minor;
end

%%notesInTheMeasure in chordimoort we need to trans
notesInTheMeasure = chordImportInfo.notesInTheMeasure;
%%some infoi init
iMTNoteMean = [];
%compareMT=0;
%% tonaltranswheel structure we need to use later
modWheel=[0 1 2 3 4 5 6 7 8 9 10 11];

%%tonal meaning maping
tonalMajorWheel = [-6 -5 -4 -3 -2 -1 1 2 3 4 5 6]; % -6 = 7 F# =Gb
tonalMinorWheel = [-3 -2 -1 1 2 3 4 5 6 -6 -5 -4];
%%note meaning maping
tonalMajorWheelMod = [6 1 8 3 10 5 0 7 2 9 4 11]; %pitch mod 12
tonalMinorWheelMod = [3 10 5 0 7 2 9 4 11 6 1 8];

major=[1 3 5 6 8 10 12]; %  f f h f f f 
minor=[1 3 4 6 8 9 11];   % f h f f h f

IMTmaOrMi=0; % 0 is major ///  1 is minor
MMTmaOrMi=0; % 0 is major ///  1 is minor

%% PartA----------------------------------------------------------
%% anlysis importMeasure is minor or major and find index in tonal"M/m"Whell
importMeasureTonal = mod(CIT,2);
if (importMeasureTonal == 0) %is minor and must extract from /2
    IMTmaOrMi=1;
    importMeasureTonal = CIT/2;  %make minor finding the content from major tonal
    indexIMT = find(tonalMinorWheel == importMeasureTonal);
else %Is major
    %importMeasureTonal  no chage
    indexIMT = find(tonalMajorWheel == importMeasureTonal);
end
%% give the meaning into measure tonal like
% major c with  c  d   e   f   g  a    b   
%                        I II III VI V VI VII
%note meaning maping
%%{
if  (IMTmaOrMi == 0)
    startIMTIndex= tonalMajorWheelMod(1,indexIMT);
else
    startIMTIndex= tonalMinorWheelMod(1,indexIMT);
end
startIMTIndex = startIMTIndex+1;

iMTNoteMean = zeros(1,12);
for i = 1 : 12
    iMTNoteMean(1,i) = modWheel(1,startIMTIndex);
    %reloop the notes mod in to a cycle like c d e f g a b 'c'
    if (startIMTIndex == 12)
        startIMTIndex = 1;
    else
        %donothing
        startIMTIndex = startIMTIndex + 1;
    end
end
%}
%% present major or minor note meaning here


%% PartB----------------------------------------------------------
%SET the mainMeasure Infomation about tonal direction in cycle
%IS major or minor
%ATTATION!!!!!!! we can set  the higher layer funtion then here
mainMeasureTonal = mod(MIT,2);
if (mainMeasureTonal == 0) %is minor and must extract from /2
    mainMeasureTonal = MIT/2;
    indexMMT = find(tonalMinorWheel == mainMeasureTonal);
    MMTmaOrMi=1;
else %is major
    %importMeasureTonal      no chage
    indexMMT = find(tonalMajorWheel == mainMeasureTonal);
end

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
%cuz major is have 3 semitone with minor
if MMTmaOrMi ~= IMTmaOrMi
    if IMTmaOrMi==1
        compareMT=compareMT+3;
    else
        compareMT=compareMT-3;
    end
else
    %do nothing
end

%% START translate every note
%%need to fix the notesInTheMeasure(i,7) notesInTheMeasure(i,8) meaning
%%here
sizeNITM = size(notesInTheMeasure,1);
for i = 1 : sizeNITM
    %FORpartA----------------------------------------------------------
        modNITM=mod(notesInTheMeasure(i,5),12);
        notesInTheMeasure(i,7)= find(iMTNoteMean==modNITM);
    %FORpartB----------------------------------------------------------
        tranNow=(notesInTheMeasure(i,5)+compareMT);
        tranNow=mod(tranNow,12);
        notesInTheMeasure(i,8) = notesInTheMeasure(i,5);
        notesInTheMeasure(i,5)=notesInTheMeasure(i,4)*12+tranNow;
end