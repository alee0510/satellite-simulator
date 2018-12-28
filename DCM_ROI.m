function [ ROI ] = DCM_ROI( RAAN,i,u )
%MATRIX TRANSFORMATION FROM INERTIAL TO ORBITAL
%   We Use a squence '3-1-3' as follow :
%   3, begin with rotaton about z inertial axis, though the RAAN, omg
%   1, the follow by rotation about x-inertial axis, though Inclination, i
%   3, the last roattion about z-inertial axis, argument of latitude, u
%   all angle unit in degree, and alttitude in km

R1_270=[1 0 0;...
    0 cosd(270) sind(270);...
    0 -sind(270) cosd(270)];
R3_90=[cosd(90) sind(90) 0;...
    -sind(90) cosd(90) 0;...
    0 0 1];
R0=R1_270*R3_90; %R00'

%roation about x inertial axis R1
R1_i=[1 0 0;...
    0 cosd(i) sind(i);...
    0 -sind(i) cosd(i)]; %roation in x axis with teta=i
R3_RAAN=[cosd(RAAN) sind(RAAN) 0;...
    -sind(RAAN) cosd(RAAN) 0;...
    0 0 1];
R3_u=[cosd(u) sind(u) 0;...
    -sind(u) cosd(u) 0;...
    0 0 1];

%following rotation, 3-1-3 or Z-X-Z inertial axis, so DCM calculated by
ROI=R0*R3_u*R1_i*R3_RAAN; %matrik rotation, dimention 3x3

end
