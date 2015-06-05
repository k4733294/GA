function NewChrlx=Rws(FitnV,Nsel)

choicednum=2;
suma = sum(FitnV);
sumfit(1)= FitnV(1)/suma;

for i=2:Nsel
    sumfit(i) = sumfit(i-1) + FitnV(i)/suma;
end
NewChrlx(Nsel,1) = 0;
selFitnV=randi([1 100],1,choicednum);
selFitnV=selFitnV/100;

for j = 1:choicednum
    search = selFitnV(j);
    find = Binarysearch(sumfit,search,Nsel);
    selFinVfind(j) = find;
end

NewChrlx = selFinVfind;