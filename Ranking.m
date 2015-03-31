function FitV=Ranking(ObjV,RFun)
% Ranking function
if nargin==1
    error('Ranking function needs two parameters');
end

if ~(length(ObjV(:,1))==length(RFun))
    error('RFun have to be of the same size than ObjV.');
end

% (sum the fitness from every part of chromesome at 32 chromesome)
[val,pos]=sort(ObjV);
FitV(pos)=flipud(RFun);
FitV=FitV';