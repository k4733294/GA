function  mTNoteMean = NoteMeanCreate(mTNoteMean,indexMT,IT,tonalMajorWheelMod,tonalMinorWheelMod,majorMa,minorMa)

if  (IT == 1)
    startMT= tonalMajorWheelMod(1,indexMT);
    mTNoteMean(1,:) = majorMa;
else
    startMT= tonalMinorWheelMod(1,indexMT);
    mTNoteMean(1,:) = minorMa;
end
for i = 1 : 12
     %reloop the notes mod in to a cycle like c d e f g a b 'c'
    startMMTMA = startMT + i -1;
    if (startMMTMA >= 12)
        startMMTMA = startMMTMA - 12 ;
    end
    mTNoteMean(2,i) = startMMTMA;
end