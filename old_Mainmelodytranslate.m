function mainMelodyInCreate = Mainmelodytranslate(mainMelodyNeedToTranslate)


mainMelody = mainMelodyNeedToTranslate;
%N = 20;  % num notes
M = ones(20,16);


for i = 1 : 20 
    for j = 1 : 16 
        
        
        if (mainMelody(i,j) == -2)
                         M(i,j) = -2;
            
        elseif (mainMelody(i,j) == -1 )
                         M(i,j) = -1;
            
        elseif(mainMelody(i,j) ~= -2 && mainMelody(i,j) ~= -1)

                        M(i,j) = mainMelodyNeedToTranslate(i,j)+60;

        else
              
            %mainMelodyPrev = mainMelody(i,j);
            %countNodePrev = countNode;
            
            %duration = 0;
            
        end
    end
end


mainMelodyInCreate = M ; 

%midi_new = matrix2midi(M);
%writemidi(midi_new, '/home/hooshuu/Documents/MATLAB/matlab-midi/tests/midi/gaMelody.mid');


end