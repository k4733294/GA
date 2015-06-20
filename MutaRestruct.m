function selChXov = MutaRestruct(selChXov,gaDat,IndicesMuta)

%{
 %%do not change the struct flowing of below step
 % must up restruct to chromsome then do down flow by noteInTheMeasure at
     the chromsome level
 %}

%% measure struct Comparing to up Level 
noteTrack = ChordStructCompare(selChXov,0);
selChXov.notesInTheMeasure = noteTrack;

%% measure struct Comparing to down level
selChXov = NoteTableToBarBeatStruct4SelChXov(selChXov,gaDat,IndicesMuta);
%gaDat = NoteTableToBarBeatStruct(gaDat,IndicesMuta);


