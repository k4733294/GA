function NewChrlx=Rws(FitnV,nSel)

choicedNum=2;
selFinVfind = zeros(1,2);
suma = sum(FitnV(:,1));
sumFit = zeros(1,nSel);

sumFit(1,1)= FitnV(1,1)/suma;
if sumFit(1,1) <= 0
    sumFit(1,1) = 0;
end
for i = 2 : nSel
    if sumFit(1,i-1) <= 0
        sumFit(1,i-1)  = 0;
    end
    sumFit(1,i) = sumFit(1,i-1) + FitnV(i,1) / suma;
end

stopSel = 0;
while stopSel < 1
    for j = 1 : choicedNum
        selFitnV = randi([1 500],1,choicedNum);
        selFitnV = selFitnV / 501;
        search = selFitnV(j);
        findSearch = sumFit(1,:) >= search;
        sumFitFindIndex = find(findSearch(1,:) == 1 ,1, 'first');
        selFinVfind(1,j) = sumFitFindIndex;
        if selFinVfind(1,j) == 1
            selFinVfind(1,j) = 1;
        end
    end
    if selFinVfind(1,1) == selFinVfind(1,2)
        stopSel = 0 ;    
    else
        stopSel = 1;
    break
    end
end
NewChrlx = selFinVfind;