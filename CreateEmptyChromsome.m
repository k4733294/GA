function gaDat = CreateEmptyChromsome(gaDat)

pS = gaDat.populationSize;
numMainMeasure = size(gaDat.mainImportInfo.measure,2);
for pPopulationSize = 1 : pS
    for pMeasure = 1 : numMainMeasure
        %% 
        sizeMnC = 300;
        gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).noteContent = zeros(sizeMnC);
        %%
        numMainMeasureBeat = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
        for pBeat  = 1 : numMainMeasureBeat
            %%
            sizeMBnC = 30;
            gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat(1,pBeat).noteContent = zeros(sizeMBnC);
            %%
             %{
            numMainMeasureBeatNote = size(gaDat.mainImportInfo.measure(1,numMainMeasure).beat,2);
             for pNote = 1 : numMainMeasureBeatNote
                 %%
                sizeMBNnC = 200;
                gaDat.chromsome(1,pPopulationSize).measure(1,pMeasure).beat(1,pBeat).note(1,pNote).noteContent = zeros(sizeMBNnC);
             end
            %}
        end
    end
end
