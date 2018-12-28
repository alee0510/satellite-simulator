function [ RBO ] = DCM_RBO6( T1,T2,T3,A )
%MATRIX TRANSFORMATION FORM ORBITAL TO BODY REFERENCE FRAME
%   there 12 posibility combination form,according squence of roation axis
%   T1,T2,T3 is an euler angle, meansure relative to Orbital Frame, in
%   degree
%   A= is squence of rotation
%   XYZ XZY ZXY ZYX YXZ YZX
%   each DCM=Direc Cosines Matrix have dimention 3x3
% let's define, R1 as rotation about o1, x-axis
%               R2 as rotation about o2, y-axis
%               R3 as rotation about o3, z-axis
% and we fix that 
%   T1, rotation angle about o1, x-axis
%   T2, rotation angle about o1, y-axis
%   T3, rotation angle about o1, z-axis

%Rotation About o1
R1=[1 0 0;...
    0 cosd(T1) sind(T1);...
    0 -sind(T1) cosd(T1)]; %R1=Rx(T1)

R2=[cosd(T2) 0 -sind(T2);...
    0 1 0;
    sind(T2) 0 cosd(T2)]; %R2=Ry(T2)

R3=[cosd(T3) sind(T3) 0;...
    -sind(T3) cosd(T3) 0;...
    0 0 1]; %R3=Rz(T3)

%calculate DCM according the squence
if strcmp(A,'XYZ')
    RBO=R3*R2*R1;
elseif strcmp(A,'XZY')
    RBO=R2*R3*R1;
elseif strcmp(A,'ZXY')
    RBO=R2*R1*R3;
elseif strcmp(A,'ZYX')
    RBO=R1*R2*R3;
elseif strcmp(A,'YXZ')
    RBO=R3*R1*R2;
elseif strcmp(A,'YZX')
    RBO=R1*R3*R2;
end
    
end

