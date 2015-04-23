function mixMap = MixMapCreate()

%%Create dialogMixMap present do we need to mix from other imporchord
%   0 from original  1 make change
dialogMixMap = [1 0 1 0;
                            0 1 0 1;
                            1 1 0 0;
                            0 0 1 1;
                            0 0 0 0];
%%Create patternMixMap present do we need to mix from other imporchord
%   0 from original  1 make change
patternMixMap = [1 0 1 0;
                               0 1 0 1;
                               1 1 0 0;
                               0 0 1 1;
                               0 1 1 0;
                               1 0 0 1;
                               0 0 0 0];
%%Create measureMixMap present do we need to mix from other imporchord
%   0 from original  1 make change
measureMixMap = [1 0 0 0;
                                   0 1 0 0;
                                   0 0 1 0;
                                   0 0 0 1;
                                   1 0 1 0;
                                   0 1 0 1;
                                   1 1 0 0;
                                   0 0 1 1;
                                   0 1 1 0;
                                   1 0 0 1;
                                   1 1 1 1;
                                   0 0 0 0];
                       
mixMap = struct('dialogMixMap',dialogMixMap,'patternMixMap',patternMixMap,'measureMixMap',measureMixMap);