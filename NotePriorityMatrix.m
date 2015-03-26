function notesRank = NotePriorityMatrix(importStruct,choiceFunciton,cL)
%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDat.mat');
%{
gaDat.chordImportInfo(1,sampleNumChoice).measure(1,pMeasure).beat(1,1).noteContent
samplePropertiesChoice;
sampleNumChoice;
sampleFrameChoice;
gaDat.mainImportInfo.measure(1,pMeasure).beat(1,pBeat).noteContent;
%}


% Check input
if (choiceFunciton == 0)
    %using for mainchord got chordmatrix input 
    notesRank = MainNPM(importStruct,cL);   
else
    notesRank = SFCNPM(importStruct,cL);
end





            
