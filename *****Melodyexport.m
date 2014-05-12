function Melodyexport(mainMelody,version)

N = 320;  % num notes
M = zeros(N,6);

countNode = 1;
countNodePrev = 0;
mainMelodyPrev=0;
duration=0;
totalTimes = 0;
firstNodeTime = 0.125;


for i = 1 : 20 
    for j = 1 : 16 
        
        
        if (mainMelody(i,j) == -2)
            
            duration = duration + 0.125;
             
        elseif (mainMelody(i,j) == -1 )
             
            if(countNodePrev~=0)
                
                if(mainMelodyPrev ~= -1)
                    M(countNodePrev,1) = 1;         % all in track 1
                    M(countNodePrev,2) = 1;         % all in channel 1
                    M(countNodePrev,3) = mainMelodyPrev;
                    M(countNodePrev,4) = 78;
                    M(countNodePrev,5) = totalTimes;  % note on:  notes start every .5 seconds
                    M(countNodePrev,6) = M(countNodePrev,5) + duration + firstNodeTime;   % note off: each note has duration .5 seconds
  
                    countNode = countNode+1; 
                    
                else
                    %M(countNodePrev,3) = 0;
                end
            
            totalTimes=totalTimes+duration+firstNodeTime;
            
            end
            
            countNodePrev = countNode;
            mainMelodyPrev = -1;
            duration = 0;
       
        elseif(mainMelody(i,j) ~= -2 && mainMelody(i,j) ~= -1)
            
            if(countNodePrev~=0)
            
                if(mainMelodyPrev ~= -1)
                        M(countNodePrev,1) = 1;         % all in track 1
                        M(countNodePrev,2) = 1;         % all in channel 1
                        M(countNodePrev,3) = mainMelodyPrev;
                        M(countNodePrev,4) = 78;
                        M(countNodePrev,5) = totalTimes;  % note on:  notes start every .5 seconds    
                        M(countNodePrev,6) = M(countNodePrev,5) + duration + firstNodeTime;   % note off: each note has duration .5 seconds  
                        
                        countNode = countNode + 1; 
                    else
                        %M(countNodePrev,3) = 0;    
                end 
            
            totalTimes = totalTimes + duration + firstNodeTime;
            
            end
            
            mainMelodyPrev = mainMelody(i,j);
            countNodePrev = countNode;
            
            duration = 0;
            
        end
        
    end
    
end
      
    if(countNodePrev ~= 0)
        M(countNodePrev,1) = 1;         % all in track 1
        M(countNodePrev,2) = 1;         % all in channel 1
        M(countNodePrev,5) = totalTimes;  % note on:  notes start every .5 seconds
        M(countNodePrev,6) = M(countNodePrev,5) + firstNodeTime;   % note off: each note has duration .5 seconds
    end


midi_new = matrix2midi(M);
fileExportPath = strcat('/home/hooshuu/Documents/MATLAB/matlab-midi/tests/midi/gaMelody', version,'.mid');
writemidi(midi_new, fileExportPath);