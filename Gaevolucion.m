function gaDat=Gaevolucion(gaDat)

disp('######   FitnessProcess   #########')
%% FITNESSS ---------------------------------------------------------
if isempty(gaDat.ObjfunPar)
    FitnV = ObjfunChordFit(gaDat.populationSize,gaDat);
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
[selChXovFst,IndicesFst] = Select('rws',gaDat.Chrom,FitnV,1);
[selChXovSnd,IndicesSnd] = Select('rws',gaDat.Chrom,FitnV,1);
%}
% CROSSOVER--------------------------------------------------------------------------------
% Uniform crossover.
%%{
gaDat = lxov(selChXovFst,selChXovSnd,IndicesFst,IndicesSnd,gaDat);
NewMeloPath = CreateNewFolderForMeloChrom(gaDat);
version = strcat(NewMeloPath,'ixovProgressNum_',gaDat.gen,'_Chrom1_',IndicesFst,'_Chrom2_',IndicesSnd);
Melodyexport(selChXovFst,version);
Melodyexport(selChXovSnd,version);
%}
%SELECTION for Mutation---------------------------------------------------------------
%Stochastic Universal Sampling (SUS).
%{
[selChMuta,IndicesMuta] = Select('rws',gaDat.Chrom,FitnV,1);
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
sampleFrameChoice = SFCRestruct(sampleFrameChoice);
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
    






