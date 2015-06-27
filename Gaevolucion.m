function gaDat=Gaevolucion(gaDat)
%load('/Users/hooshuu/Documents/MATLAB/GA/struct_data/gaDatRollingInTheDeepNoStructFixAllnoteForFitNessIxov.mat');
disp('######   FitnessProcess   #########')
%% FITNESSS ---------------------------------------------------------
%%{
if isempty(gaDat.ObjfunPar)
    gaDat = ObjfunChordFit(gaDat.populationSize,gaDat);
else
    %{ 
            % no needed
            %ObjV(:,i) = Objfunchordfit2(gaDat.Chrom(i),gaDat.mainImportInfo,gaDat.ObjfunPar);
            %ObjV(:,i) =  returnToObjV ;
    %}
end
%}
%%
%SELECTION for CROSSOVER---------------------------------------------------------
%Stochastic Universal Sampling (SUS).
%%{
fitnV = gaDat.fitnV;
[selChXov,indicesXov] = Select('rws',gaDat.chromsome,fitnV,1);
gaDat.indicesXov = indicesXov;
%}
% CROSSOVER--------------------------------------------------------------------------------
% Uniform crossover.
%%{
selChXov = lxov(selChXov,indicesXov,gaDat);
%{
%%Export every ixov result about 2 chromsome
NewMeloPath = CreateNewFolderForMeloChrom(gaDat);
genStr = num2str(gaDat.gen);
indicesXov1Str = num2str(indicesXov(1,1));
indicesXov2Str = num2str(indicesXov(1,2));
version = strcat(NewMeloPath,'ixovProgressNum_',genStr,'_Chrom1_',indicesXov1Str,'_',indicesXov2Str);
Melodyexport(selChXov(1,1),version{1});
version = strcat(NewMeloPath,'ixovProgressNum_',genStr,'_Chrom2_',indicesXov1Str,'_',indicesXov2Str);
Melodyexport(selChXov(1,2),version{1});
%}
%}
%SELECTION for Mutation---------------------------------------------------------------
%Stochastic Universal Sampling (SUS)
%%{
%fitnV = gaDat.fitnV;
%[selChMuta,IndicesMuta] = Select('rws',gaDat.chromsome,fitnV,1);
%}
%% MUTATION----------------------------------------------------------------------------------
%%{
selChXov(1,1) = Mutbga(selChXov(1,1) ,indicesXov(1,1),gaDat);
selChXov(1,2) = Mutbga(selChXov(1,2),indicesXov(1,2),gaDat);

%}
%{
%%Export every ixov result about 2 chromsome 
NewMeloPath = CreateNewFolderForMeloChrom(gaDat);
genStr = num2str(gaDat.gen);
indicesXov1Str = num2str(indicesXov(1,1));
indicesXov2Str = num2str(indicesXov(1,2));
version = strcat(NewMeloPath,'MutbGaProgressNum_',genStr,'_Chrom1_',indicesXov1Str,'_',indicesXov2Str);
Melodyexport(selChXov(1,1),version{1});
version = strcat(NewMeloPath,'MutbGaProgressNum_',genStr,'_Chrom2_',indicesXov1Str,'_',indicesXov2Str);
Melodyexport(selChXov(1,2) ,version{1});
%}
%% Reinsert the best individual  -----------------------------------------------------
%minIndex just one but i have two of CHROM result here so.... how should i
%do  struct to  ixov  and mutbga inside
%gaDat.Chrom(IndicesFst,:) = gaDat.selChXovFst;
% Optional additional task required by user
% get back the two of ixov mutbga result to the bad fitScore Chromsome
minIndex = gaDat.xmin;
minScore = gaDat.fxmin;
fitnV(minIndex,1) = NaN;
[~,minIndex2] = min(fitnV(:,1));
fitnV(minIndex,1) = minScore;
gaDat.fitnV = fitnV;
%if minIndex > 0
    %gaDat.chromsome(1,indicesXov(1,1)) = selChXov(1,1);
    %gaDat.chromsome(1,indicesXov(1,2)) = selChXov(1,2);
%else
    gaDat.chromsome(1,minIndex) = selChXov(1,1);
    gaDat.chromsome(1,minIndex2) = selChXov(1,2);
%end

%{
%ATTATION every important part must unmute.  here is servival part
minMainMelody = [];
maxMainMelody = [];
for i = 1 : 20
    for j = 1 : 16
        minMainMelody(i,j) = gaDat.xmin(i+j);
        maxMainMelody(i,j) = gaDat.xmax(i+j);
    end
end
%}

 GaIteration(gaDat)
%}
    






