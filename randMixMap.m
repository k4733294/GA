function rand = randMixMap(randChoice)

if randChoice ==0 %randDialog
    rand = randi([1,5]);
elseif randChoice ==1 %randMeasure 
    rand = randi([1,7]);
else %randBeat
    rand = randi([1,12]);
end


    
