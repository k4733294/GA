function rand = randMixMap(randChoice)

if randChoice ==0 %randDialog
    rand = randi([1,4]);
elseif randChoice ==1 %randMeasure 
    rand = randi([1,1]);
else %randBeat
    rand = randi([1,12]);
end


    
