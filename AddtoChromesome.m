function gaDat = AddtoChromesome(gaDat,pPopulationSize,pMeasure,pBeat,sampleFrameChoice,cL)
%{
gaDat,
sampleFrameChoice,
pMeasure,
pBeat
samplePropertiesChoice
%}

for i = 1:cL
 %% Beat layer and below info we changed to which we create here
  gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat(1,pBeat+cL-1) = sampleFrameChoice.measure(1,1).beat(1,pBeat+cL-1);
 %% before the beat layer info , we need to add in , ex measure notecontent
 MforInsert = sampleFrameChoice.measure.noteContent;
 
 fisrtBeatNumInSFC = sampleFrameChoice.measure(1,1).beat(1,pBeat+cL-1).noteContent(1,1) ;
 endBeatNumInSFC = sampleFrameChoice.measure(1,1).beat(1,pBeat+cL-1).noteContent(end,1) ;
 
 IndexContentFirst = find(MforInsert(:,1) == fisrtBeatNumInSFC,1,'first');
 IndexContentEnd = find(MforInsert(:,1) == endBeatNumInSFC,1,'last');
 
 preventExceed = 200;
 sizeOfMeasureNoteNums = size(MforInsert,1);
 sizeOfMeasureNoteProperties= size(MforInsert,2);
 %%creatzeroNoteTable
 tempMeasureNoteContent = zeros(sizeOfMeasureNoteNums+preventExceed,sizeOfMeasureNoteProperties);
 %%append origin part that before we need to change
 tempMeasureNoteContent(1:IndexContentFirst-1,:) = MforInsert(1:IndexContentFirst-1,:);
 %%append part of we need to change
 tempMeasureNoteContent(IndexContentFirst:IndexContentEnd,:) = MforInsert(IndexContentFirst:IndexContentEnd,:);
 %%append origin part that below we need to change
 tempMeasureNoteContent(IndexContentEnd+1:sizeOfMeasureNoteNums,:) = MforInsert(IndexContentEnd+1:sizeOfMeasureNoteNums,:);
 %%filter empty item
 tempMeasureNoteContent = EmptyItemFilter(tempMeasureNoteContent);
 %% Export
 gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).noteContent =  tempMeasureNoteContent;
 gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat(1,pBeat+cL-1) = sampleFrameChoice.measure(1,1).beat(1,pBeat+cL-1);
end

 
 
         
        



