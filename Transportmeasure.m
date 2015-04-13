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
mMTNoteMean = zeros(2,12);
iMTNoteMean = zeros(2,12);
%%tonal meaning maping
tonalMajorWheel = [-6 -5 -4 -3 -2 -1 1 2 3 4 5 6]; % -6 = 7 F# =Gb
tonalMinorWheel = [-3 -2 -1 1 2 3 4 5 6 -6 -5 -4];
%%note meaning maping
tonalMajorWheelMod = [6 1 8 3 10 5 0 7 2 9 4 11]; %pitch mod 12
tonalMinorWheelMod = [3 10 5 0 7 2 9 4 11 6 1 8];
%% 1~7 note in the music alphabet  8~11 out of music alphabet
majorMa = [0 7 1 8 2 3 9 4 10 5 11 6]; %  f f h f f f  
minorMa = [0 7 1 2 8 3 9 4 5 10 6 11];   % f h f f h f
%SET the mainMeasure Infomation about tonal direction in cycle
%IS major or minor
%ATTATION!!!!!!! we can set  the higher layer funtion then here
if (MIT == 1) %is major
    indexMMT = find(tonalMajorWheel == mainImportInfo.tonal(1,1));  
else 
    indexMMT = find(tonalMinorWheel == mainImportInfo.tonal(1,1));
end
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
mMTNoteMean = NoteMeanCreate(mMTNoteMean,indexMMT,MIT,tonalMajorWheelMod,tonalMinorWheelMod,majorMa,minorMa);
iMTNoteMean = NoteMeanCreate(iMTNoteMean,indexIMT,CIT,tonalMajorWheelMod,tonalMinorWheelMod,majorMa,minorMa);
%% START translate every note
%%need to fix the notesInTheMeasure(i,7) notesInTheMeasure(i,8) meaning
%% try to find every sample note Meaning in iMTNoteMean to mMTNoteMean presenting Maintoanl Musical Alphabet
sizeNITM = size(notesInTheMeasure,1);
for i = 1 : sizeNITM
        abNotes= mod(notesInTheMeasure(i,5),12);
        noteiMTMAIndex= find(iMTNoteMean(2,:) == abNotes,1,'first');
        noteiMTMAIndex = iMTNoteMean(1,noteiMTMAIndex);
        %move untransNote to 8 col
        %notesInTheMeasure(i,8) = notesInTheMeasure(i,5);
        %changed Note at 5 col
        noteiMTMAIndex = find(mMTNoteMean(1,:)==noteiMTMAIndex,1,'first');
        notesInTheMeasure(i,5) = mMTNoteMean(2,noteiMTMAIndex) + 12*notesInTheMeasure(i,4);
        %modNITM = mod(notesInTheMeasure(i,5),12);
        %notesInTheMeasure(i,7) = modNITM;
end