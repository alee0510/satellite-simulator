function [ B_NED ] = LTC_to_NED_edit( Br,Bt,Bp )
%-------------------------------------------------------------------------%
%                       TRANSFORMATION COORDIANATE
% From Local Tangent coordinated to NED
% nomeclature symbol :
% local tangent coordinates, B = [Br Bt Bp]
%   Br is B in r direction, B(1)
%   Bt is B in teta direction, B(2)
%   Bp is B in phi direction, B(3)
% Cartesian Coordinate B = [bX bY bZ]
%   bX is B in North direction
%   bY is B in East direction
%   bZ is B in Down direction
%eps=epsilon, corrected oblateness factor of Earth, 
%base on : 
%   Davis J., Mathematical Modeling of Earth’s Magnetic Fieldm, 
%   Technical Note, Virginia Tech., Blacksburg, 2004.
%-------------------------------------------------------------------------%

eps=0;

%deg to rad
e=eps*0.017453292519943;
c=cos(e); s=sin(e);

%Transformation Coordinates
X=-(Bt*c)-(Br*s);
Y=Bp;
Z=(Br*s)-(Br*c);

%so
B_NED=[X; Y; Z];
end

