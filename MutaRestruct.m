function gaDat = MutaRestruct(gaDat,IndicesMuta)

%{
 %%do not change the struct flowing of below step
 % must up restruct to chromsome then do down flow by noteInTheMeasure at
     the chromsome level
 %}

%% measure struct Comparing to up Level 
noteTrack = ChordStructCompare(gaDat.chromsome(1,IndicesMuta(1,1)),0);
gaDat.chromsome(1,IndicesMuta(1,1)).notesInTheMeasure = noteTrack;

%% measure struct Comparing to down level
gaDat = NoteTableToBarBeatStruct(gaDat,IndicesMuta);


