function returnToObjV = objfun_chordfit(whichChrosomeToBeCal,mainMelodyInChordfitToEvaluate)

%disp(['i am handsome boy wctbc is ' ,  num2str(a)] );
%whichChrosomeToBeCal

barValue = ones(20,1);
noteValue = ones(16,1);

for i = 1:20
    for j=1:16
        if(mainMelodyInChordfitToEvaluate(i,j) == -1)
             noteValue(j,1) = 1;
        elseif(mainMelodyInChordfitToEvaluate(i,j) == -2)
             noteValue(j,1) = 5;
        else
            weight = mainMelodyInChordfitToEvaluate(i,j) - whichChrosomeToBeCal(i*j);
            weight = abs(weight); 
            switch weight
           %---------------------------------
                %harmonious interval
                case 0                  %PERFECT UNISON
                   noteValue(j,1) = 8;
                case {12,24,36}   %PERFECT OCTAVE
                   noteValue(j,1) = 8; 
                case 5                  %PERFECT FOURTH
                   noteValue(j,1) = 15;          
                case 7                  %PERFECT FIFTH
                   noteValue(j,1) = 15;
           %---------------------------------
                %imperfect consonance interval
                case 3                  %MINOR THIRD
                   noteValue(j,1) = 8;
                case 4                  %MAJOR THIRD
                   noteValue(j,1) = 8;
                case 8                  %MINOR SIXTH
                   noteValue(j,1) = 8;
                case 9                  %MAJOR SIXTH
                   noteValue(j,1) = 8;
           %---------------------------------
                %inharmonious interval
                case 1                  %MINOR SECOND
                   noteValue(j,1) = -20;
                case 2                  %MAJOR SECOND
                   noteValue(j,1) = -20;
                case 10                %MINOR SEVENTH
                   noteValue(j,1) = -20;
                case 11                %MAJOR SEVENTH
                   noteValue(j,1) = -20;
                case 6                  %DIMINISHED FIFTH
                                            %AUGMENTED FOURTH
                   noteValue(j,1) = -30;              
            end
                   barValue(i,1) = sum(noteValue);  
                  %noteValue
        end
    end
end
                barValue
                returnToObjV = barValue;
              




%disp([' whichChrosomeToBeCal is ', num2str(rowBeFitnessCalculating)])















