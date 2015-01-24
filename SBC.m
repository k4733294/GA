function sampleFrameChoice = SBC(gaDat,pMeasure,pBeat,sampleNumChoice)

%%get which sample we want  and which position in beat area;
sampleFrameChoice = gaDat.chordImportInfo(1,sampleNumChoice).measure(1,pMeasure).beat(1,pBeat);
