function mixMap = MixMapCreate()

%%Create measureMixMap present do we need to mix from other imporchord
%   0 from original  1 make change
patternMixMap = [1 0 1 0;
                                0 1 0 1;
                                1 1 0 0;
                                0 0 1 1;
                                0 0 0 0;];
%%Create measureMixMap present do we need to mix from other imporchord
%   0 from original  1 make change
measureMixMap = [1 0 1 0;
                                   0 1 0 1;
                                   1 1 0 0;
                                   0 0 1 1;
                                   0 0 0 0;];
%%Create beatMixMap present do we need to mix from other imporchord
%   0 from original  1 make change
beatMixMap = [1 0 0 0;
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
                           0 0 0 0;];
                       
mixMap = struct('measureMixMap',measureMixMap,'beatMixMap',beatMixMap);