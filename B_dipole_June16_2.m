function B = B_dipole_June16_2(R,i,T,t)
%DIPOLE MODEL OF EARTHS MAGNETIC FIELD IN LOCAL HORIZONTAL FRAME (NED)
%-------------------------------------------------------------------------%
% Output in Locac Horizontal Coordinates, unit in Nano Tesla (nT)
%   B = Earth Magnetic Model
%   B = [Bx By Bz]
%   Bx is B in North direction
%   By is B in Down direction
%   Bz is B in East direction
%Input
%   i = inclination
%   n = mean motion, n=2*pi/T;
%   T = period of orbit, in seconds
%   rt= radius orbit, measure from center of Earth
% source : Capo-Lugo Pedro A. and John Rakoczy.
%          "The B-dot Earth Average Magnetic Field".
%          NASA Marshall Space Flight Center Huntsville, Alabama 35812. 
%-------------------------------------------------------------------------%
%coef
Uf=7.95*10^15; %magnetic moments, tesla
U=Uf*10^9; %convert to nano tesla

%mean motion
n=(2*pi)/T;

%dipole model
a=U/(R^3);
ir=i*0.017453292519943; %convert to radian
s=sin(ir);
c=cos(ir);
b=n*t;
st=sin(b);
ct=cos(b);

B=a*[ct*s; -1*c; 2*st*s];
end
%----------------------------------END------------------------------------%