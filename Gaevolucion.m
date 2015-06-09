function gaDat=Gaevolucion(gaDat)

disp('######   FitnessProcess   #########')
%% FITNESSS ---------------------------------------------------------
if isempty(gaDat.ObjfunPar)
    gaDat = ObjfunChordFit(gaDat.populationSize,gaDat);
else
    %{
            % no needed
            %ObjV(:,i) = Objfunchordfit2(gaDat.Chrom(i),gaDat.mainImportInfo,gaDat.ObjfunPar);
            %ObjV(:,i) =  returnToObjV ;
    %}
end
%%
%SELECTION for CROSSOVER---------------------------------------------------------
%Stochastic Universal Sampling (SUS).
%%{
FitnV = gaDat.FitnV;
[selChXov,indicesXov] = Select('rws',gaDat.chromsome,FitnV,1);
%}
% CROSSOVER--------------------------------------------------------------------------------
% Uniform crossover.
%%{
gaDat = lxov(selChXov,indicesXov,gaDat);
%{
NewMeloPath = CreateNewFolderForMeloChrom(gaDat);
genStr = num2str(gaDat.gen);
indicesXov1Str = num2str(indicesXov(1,1));
indicesXov2Str = num2str(indicesXov(1,2));
version = strcat(NewMeloPath,'ixovProgressNum_',genStr,'_Chrom1_',indicesXov1Str,'_',indicesXov2Str);
Melodyexport(gaDat.chromsome(1,indicesXov(1,1)),version{1});
version = strcat(NewMeloPath,'ixovProgressNum_',genStr,'_Chrom2_',indicesXov1Str,'_',indicesXov2Str);
Melodyexport(gaDat.chromsome(1,indicesXov(1,2)),version{1});
%}
%}
%SELECTION for Mutation---------------------------------------------------------------
%Stochastic Universal Sampling (SUS).
%{
[selChMuta,IndicesMuta] = Select('rws',gaDat.chromsome,FitnV,1);
%}
%% MUTATION----------------------------------------------------------------------------------
%{
SelCh = Mutbga(selChMuta,gaDat.FieldD,[gaDat.Pm 1]); % Codificaci???n Real.
%}
% Reinsert the best individual  -----------------------------------------------------
 %minIndex just one but i have two of CHROM result here so.... how should i
 %do
 %% struct to  ixov  and mutbga inside
%gaDat.Chrom(IndicesFst,:) = gaDat.selChXovFst;
% Optional additional task required by user

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
    






