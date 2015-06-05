function gaDat=Gaevolucion(gaDat,plotGraph)

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
        %{
        % display the var variation
        disp(['(i:j) is '  , num2str(j)])
        disp(['ObjV(i:j) ' ,num2str(ObjV(i:j))])
        %}
%% 
%SELECTION for CROSSOVER---------------------------------------------------------
% Stochastic Universal Sampling (SUS).
%%{
   [SelCh,Indices] = Select('rws',gaDat.Chrom,FitnV,1);
%}
% CROSSOVER--------------------------------------------------------------------------------
% Uniform crossover.
%%{
    SelCh = lxov(SelCh,gaDat.Pc,gaDat.alfa,gaDat.barsize);
%}   
%SELECTION for Mutation---------------------------------------------------------------
%Stochastic Universal Sampling (SUS).
%%{
   [SelCh,Indices] = Select('rws',gaDat.Chrom,FitnV,1);
%}   
%% MUTATION----------------------------------------------------------------------------------
%%{ 
SelCh = Mutbga(SelCh,gaDat.FieldD,[gaDat.Pm 1]); % Codificaci???n Real.
    
% Reinsert the best individual  -----------------------------------------------------
 %minIndex just one but i have two of CHROM result here so.... how should i
 %do
  gaDat.Chrom(Indices,:) = SelCh;
    
% Optional additional task required by user
 GaIteration(gaDat,plotGraph)
%}
    






