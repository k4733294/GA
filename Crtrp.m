function tempChrom = Crtrp(tempBarSize,majorNote,tempBarNum,pSize)
%{
tempNIND is 320 in here
tempFieldD is 500 by population size
output is initaial chromsome by some rules at below

initial population rules 
 rule 1 : note length compare both of it , find the main note in  this bar
 rule 2 : give this bar a pretty good chord like 3 major or minor for defult setting
%rule 3 : at a range of +-2 scales 
%}
melodyProgressContant=[];
tempChrom=[];
  for i = 1 :pSize
  tonalVariableContant =Tonalgenerate(tempBarNum,majorNote);
  melodyProgressContant = Melodygenerate(tonalVariableContant,tempBarNum,tempBarSize); 
  tempChrom(:,i)=melodyProgressContant;
  end
  
   % onePopulationGenerate = 

function tonalVariableContant = Tonalgenerate(tempBarNum,majorNote)

     tonalVariableOn = randi([1 5],1,tempBarNum);
    %which tone is created by your major note
    % 1 major tonal      f f h f f f h
    % 2 dominant        major -5
    % 3 subdominant  major +5
    % 4 organum         major -3
    % 5 minor tonal     f h f f h f f 
     toNalMatrix = zeros(tempBarNum,27);
     
for i = 1 : tempBarNum
    switch tonalVariableOn(1,i)
        case  1 
           toNalMatrix(i,:) = majorNote + [-23 -21 -19 -17 -16 -14 -12 -11 -9 -7 -5 -4 -2 0 2 4 5 7 9 11 12 14 16 17 19 21 23];  
         case 2
           toNalMatrix(i,:) = (majorNote - 5) + [-23 -21 -19 -17 -16 -14 -12 -11 -9 -7 -5 -4 -2 0 2 4 5 7 9 11 12 14 16 17 19 21 23];   
         case 3
           toNalMatrix(i,:) = (majorNote + 5) + [-23 -21 -19 -17 -16 -14 -12 -11 -9 -7 -5 -4 -2 0 2 4 5 7 9 11 12 14 16 17 19 21 23];
         case 4
           toNalMatrix(i,:) = (majorNote + -3) + [-23 -21 -19 -17 -16 -14 -12 -11 -9 -7 -5 -4 -2 0 2 4 5 7 9 11 12 14 16 17 19 21 23];
         case 5
           toNalMatrix(i,:) = majorNote +  [-22 -20 -19 -17 -15 -14 -12 -10 -8 -7 -5 -3 -2 0 2 3 5 7 8 10 12 14 15 17 19 20 22];
    end  
end
tonalVariableContant = toNalMatrix;

    
function melodyProgressContant = Melodygenerate(tonalVariableContant,tempBarNum,tempBarSize)

totalMatrix=[];
totalMatrixLength = 1;
preTotalMatrixLength = 0;

 for k = 1 : tempBarNum
     
    length = tempBarSize;
     while length  ~= 0
        melodyProgressNoteRand = randi([1 27],1,1);
        melodyProgressNote = tonalVariableContant(k,melodyProgressNoteRand);
        melodyProgressOn =  randi([1 7],1,1);
        
        switch  melodyProgressOn
            case 1 %half note
                for j = 1 :8
                    if j == 1
                        totalMatrix(totalMatrixLength,1) = melodyProgressNote;
                        totalMatrixLength=totalMatrixLength+1;
                    else
                        totalMatrix(totalMatrixLength,1) = -1;
                        totalMatrixLength=totalMatrixLength+1;
                    end
                end
                length = length - 8 ;
            case 2 %1/4 note
                for j = 1 :4
                    if j == 1
                        totalMatrix(totalMatrixLength,1) = melodyProgressNote;
                        totalMatrixLength=totalMatrixLength+1;
                    else
                        totalMatrix(totalMatrixLength,1) = -1;
                        totalMatrixLength=totalMatrixLength+1;
                    end
                end
                length = length - 4 ;
            case 3 %1/8 note
                for j = 1 : 2
                     if j == 1
                        totalMatrix(totalMatrixLength,1) = melodyProgressNote;
                        totalMatrixLength=totalMatrixLength+1;
                    else
                        totalMatrix(totalMatrixLength,1) = -1;
                        totalMatrixLength=totalMatrixLength+1;
                    end
                end
                
                length = length - 2 ;
            case 4 %1/16 note
                        totalMatrix(totalMatrixLength,1) = melodyProgressNote;
                        totalMatrixLength=totalMatrixLength+1;
                length = length - 1 ;
            case 5 %1/4 rest note
                for j = 1 :4
                        totalMatrix(totalMatrixLength,1) = -2;
                        totalMatrixLength=totalMatrixLength+1;
                end
                 length = length - 4 ;
            case 6%1/8 rest note
                 for j = 1 :2
                        totalMatrix(totalMatrixLength,1) = -2;
                        totalMatrixLength=totalMatrixLength+1;
                end
                 length = length - 2 ;
            case 7%1/16 rest note
                        totalMatrix(totalMatrixLength,1) = -2;
                        totalMatrixLength=totalMatrixLength+1;
                 length = length - 1 ;
        end
        
                previouscount=0;
                
                if (length<0)
                    startTempCount = totalMatrixLength-1; 
                    endTempCount = totalMatrixLength-10;
                    
                    for l =  startTempCount : -1 : endTempCount
                                tempTotalMatrix =  totalMatrix(l,1);
                               
                             if (tempTotalMatrix ~= -1 && tempTotalMatrix~= -2)
                                 previouscount = previouscount+1;
                                 length = length +1;
                             break
                             end
                        previouscount = previouscount+1;
                        length = length +1;
                    end
                end
                totalMatrixLength = totalMatrixLength - previouscount;
               
     end
            
               %totalMatrix
        if k == 1
                viewTM=totalMatrix(1:totalMatrixLength-1,1);
        else
                viewTM=totalMatrix(preTotalMatrixLength:totalMatrixLength-1,1);
        end
                preTotalMatrixLength=totalMatrixLength;
     
 end
    melodyProgressContant = totalMatrix(1:320,1);
    

 

 
