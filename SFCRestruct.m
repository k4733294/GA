function sampleFrameChoice = SFCRestruct(sampleFrameChoice)

    %% before the beat layer info , we need to add in , ex measure notecontent
    MforInsert = sampleFrameChoice.measure.noteContent;

    fisrtBeatNumInSFC = sampleFrameChoice.measure(1,1).beat(1,pBeat+i-1).noteContent(1,1) ;
    endBeatNumInSFC = sampleFrameChoice.measure(1,1).beat(1,pBeat+i-1).noteContent(end,1) ;

    IndexContentFirst = find(MforInsert(:,1) == fisrtBeatNumInSFC,1,'first');
    IndexContentEnd = find(MforInsert(:,1) == endBeatNumInSFC,1,'last');

    preventExceed = 500;
    sizeOfMeasureNoteNums = size(MforInsert,1);
    sizeOfMeasureNoteProperties= size(MforInsert,2);
    %%creatzeroNoteTable
    tempMeasureNoteContent = zeros(sizeOfMeasureNoteNums + preventExceed,sizeOfMeasureNoteProperties);
    %%append origin part that before we need to change
    tempMeasureNoteContent(1:IndexContentFirst-1,:) = MforInsert(1:IndexContentFirst-1,:);
    %%append part of we need to change
    tempMeasureNoteContent(IndexContentFirst:IndexContentEnd,:) = MforInsert(IndexContentFirst:IndexContentEnd,:);
    %%append origin part that below we need to change
    tempMeasureNoteContent(IndexContentEnd+1:sizeOfMeasureNoteNums,:) = MforInsert(IndexContentEnd+1:sizeOfMeasureNoteNums,:);
    %%filter empty item
    tempMeasureNoteContent = EmptyItemFilter(tempMeasureNoteContent);
    %% Export
    sampleFrameChoice.measure(1,1).noteContent = tempMeasureNoteContent;
    gaDat.sampleFrameChoice = sampleFrameChoice;