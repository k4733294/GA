gaDat.Objfun='objfun_chordfit';
lb=[-500 -500];
ub=[500 500];
gaDat.FieldD=[lb; ub];
% Execute GA
gaDat=ga(gaDat);
% Result are in
gaDat.xmin
gaDat.fxmin