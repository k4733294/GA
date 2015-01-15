function sampleFrameChoice = SBC(gaDat,pBeat,sampleNumChoice)

%%get which sample we want  and which position in beat area;
sampleFrameChoice = gaDat.chordImportInfo.measure.beat(sampleNumChoice,pBeat);
