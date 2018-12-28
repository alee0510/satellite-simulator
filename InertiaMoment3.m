function [I]   = InertiaMoment3( m,p,l,t )
%CALCULATED INITIAL INERTI MOMENT
%-------------------------------------------------------------------------%
%   this program use to calculate initial moment inertia
%   base on equation 9.44 
%   source : Curtis Howard.2005.Orbital Mechanic for Enginerring Students.
%   ELSEVIER:Burlington.
%   assumse satellite with dimetion : [p l t] or [x y z]
%   with : p= length,x
%          l= wide, y
%          t= hight, z
%   all unit in cm, and convert to km
%   coordinate in body frame coordinate with z-axis alway to center of
%   Earth
%   and m=is mass of satellite in kg
%-------------------------------------------------------------------------%
%initial
x=p;
y=l;
z=t;

%Moment Inertia 
I=[m*((y^2)+(z^2)) -m*x*y*10^-1 0;...
    0 m*((x^2)+(z^2)) -m*y*z*10^-1;...
    -m*x*z*10^-1 0 m*((x^2)+(y^2))];
end
%--------------------------------END--------------------------------------%