function mainMeasureNumProperty = getMainMeasureNumProperty(gaDat)    

totalNumMainMeasure = size(gaDat.mainImportInfo.measure,2);
totalNumMainMeasureBeat = 0;
for numMainMeasureIndex = 1 : totalNumMainMeasure
    totalNumMainMeasureBeat = totalNumMainMeasureBeat + size(gaDat.mainImportInfo.measure(1,numMainMeasureIndex).beat,2);
end

mainMeasureNumProperty = struct('totalNumMainMeasure',totalNumMainMeasure,'totalNumMainMeasureBeat',totalNumMainMeasureBeat);