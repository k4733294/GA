function gaDat = AddtoChromesome(gaDat,pPopulationSize,pMeasure,pBeat,sampleFrameChoice)
%{
gaDat,
sampleFrameChoice,
pMeasure,
pBeat
samplePropertiesChoice
%}


 %% Beat layer and below info we changed to which we create here
  gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat(1,pBeat) = sampleFrameChoice.beat(1,pBeat);
 %% before the beat layer info , we need to add in , ex measure notecontent
 
 MforInsert = sampleFrameChoice.noteContent;
 
 fisrtBeatNumInSFC = sampleFrameChoice.beat(1,pBeat).noteContent(1,1) ;
 endBeatNumInSFC = sampleFrameChoice.beat(1,pBeat).noteContent(end,1) ;
 
 IndexContentFirst = find(MforInsert(:,1) == fisrtBeatNumInSFC,1,'first');
 IndexContentEnd = find(MforInsert(:,1) == endBeatNumInSFC,1,'end');
 
 preventExceed = 200;
 sizeOfMeasureNoteNums = size(MforInsert.noteContent,1);
 sizeOfMeasureNoteProperties= size(MforInsert.noteContent,2);
 %%creatzeroNoteTable
 tempMeasureNoteContent = zeros(sizeOfMeasureNoteNums+preventExceed,sizeOfMeasureNoteProperties);
 %%append origin part that before we need to change
 tempMeasureNoteContent(1:IndexContentFirst-1,:) = MforInsert(1:IndexContentFirst-1,:);
 %%append part of we need to change
 tempMeasureNoteContent(IndexContentFirst:IndexContentEnd,:) = MforInsert(IndexContentFirst:IndexContentEnd,:);
 %%append origin part that below we need to change
 tempMeasureNoteContent(IndexContentEnd+1,sizeOfMeasureNoteNums,:) = MforInsert(IndexContentEnd+1,sizeOfMeasureNoteNums,:);
 %%filter empty item
 tempMeasureNoteContent = EmptyItemFilter(tempMeasureNoteContent);
 %% Export
 gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).noteContent =  tempMeasureNoteContent;

 
 
         
        



