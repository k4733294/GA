function selFinVfind = Binarysearch(sumFit,search)

findSearch = sumFit(1,:) >= search;
sumFitFindIndex = find(findSearch(1,:) == 1 ,1, 'first');
selFinVfind = sumFitFindIndex;
if selFinVfind == 1
    selFinVfind= 1;
end