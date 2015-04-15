function rand = randMixMap(randChoice)

if randChoice ==0 %randPattern
    rand = randi([1,5]);
elseif randChoice ==1 %randMeasure 
    rand = randi([1,5]);
else %randBeat
    rand = randi([1,12]);
end


    
