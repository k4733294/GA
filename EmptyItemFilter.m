function nonEmptyItemArray = EmptyItemFilter(haveEmptyItemArray)
       temp = haveEmptyItemArray;
       totalRow=find(haveEmptyItemArray(:,1) ,1,'last' );
       nonEmptyItemArray = temp(1:totalRow,:);
       