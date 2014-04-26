function mainMelodyInCreate = Mainmelodyimport()
% initialize matrix:

filename= '/Users/hooshuu/Documents/MATLAB/GA/matlab-midi/tests/midi/mainMelodyTenuto.txt';
%filename='/Users/hooshuu/Music/midi/pitbull-timber_ft_kesha.mid';
delimiterIn = ' ';
%headerlinesIn = 1;
mainMelody  =  importdata(filename,delimiterIn);

%M(:,3) = (60:72)';      % note numbers: one ocatave starting at middle C (60)
%M(:,4) = round(linspace(80,120,N))';  % lets have volume ramp up 80->120

mainMelodyInCreate = mainMelody;



%------------------------------------------------------------
