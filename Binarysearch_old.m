function find=Binarysearch(sumfit,search,Nsel)

low = 1;
high = Nsel - 1;

while(low <= high)
    mid = (low + high) / 2;
    mid = int16(mid);
    if (sumfit(mid) > search)
         if (mid == low)
              find = mid ; 
            break
        else    
            midlow= mid - 1;
            if (sumfit(midlow) < search)
                find = mid ; 
            break
            end
        end
        high = mid - 1;
    elseif (sumfit(mid) < search)
        if(mid == high)
            find = high;
            break
        else
            midlow= mid + 1;
            if (sumfit(midlow) > search)
                find = mid ; 
            break
            end
        end
        low = mid + 1;
    else
        find = mid;
        break
    end
end