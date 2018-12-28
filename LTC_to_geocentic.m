function [ B_geo ] = LTC_to_geocentic( B,alp,dec )
%-------------------------------------------------------------------------%
%                       TRANSFORMATION COORDIANATE
% From Local Tangent coordinated to geocentric coordinate
% nomeclature symbol :
% local tangent coordinates, B = [Br Bt Bp]
%   Br is B in r direction, B(1)
%   Bt is B in teta direction, B(2)
%   Bp is B in phi direction, B(3)
% Cartesian Coordinate B = [Bx By Bz]
%   Bx is B in x direction
%   By is B in y direction
%   By is B in z direction
%alp = Local Sidereal Time & dec = declination of observer
%base on : 
%   Davis J., Mathematical Modeling of Earth’s Magnetic Fieldm, 
%   Technical Note, Virginia Tech., Blacksburg, 2004.
%-------------------------------------------------------------------------%

%convert from deg to rad
a=alp*0.017453292519943;
d=dec*0.017453292519943;
ca=cos(a); sa=sin(a);
cd=cos(d); sd=sin(d);

%Transformation coordinates
Bx=(B(1)*cd+B(2)*sd)*ca-B(3)*sa;
By=(B(1)*cd+B(2)*sd)*sa+B(3)*ca;
Bz=B(1)*sd+B(2)*cd;

%so
B_geo=[Bx; By; Bz];
end

