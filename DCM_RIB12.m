function [ RIB ] = DCM_RIB12( T1,T2,T3,A )
%MATRIX TRANSFORMATION FORM BODY TO INERTIAL REFERENCE FRAME
%   there 12 posibility combination form,according squence of roation axis
%   T1,T2,T3 is an euler angle, meansure relative to Inertial Frame, in
%   degree
%   A= is squence of rotation
%   XYZ XZY XYX XZX
%   YXZ YZX YXY YZY
%   ZXY ZYX ZXZ ZYZ
%   each DCM=Direc Cosines Matrix have dimention 3x3
% let's define, R1 as rotation about o1, x-axis
%               R2 as rotation about o2, y-axis
%               R3 as rotation about o3, z-axis

if strcmp(A,'XYZ')
    RIB=RZ(T1)*RY(T2)*RX(T3);
elseif strcmp(A,'XZY')
    RIB=RY(T1)*RZ(T2)*RX(T3);
elseif strcmp(A,'XYX')
    RIB=RX(T1)*RY(T2)*RX(T3);
elseif strcmp(A,'XZX')
    RIB=RX(T1)*RZ(T2)*RX(T3);
elseif strcmp(A,'YXZ')
    RIB=RZ(T1)*RX(T2)*RY(T3);
elseif strcmp(A,'YZX')
    RIB=RX(T1)*RZ(T2)*RY(T3);
elseif strcmp(A,'YXY')
    RIB=RY(T1)*RX(T2)*RY(T3);
elseif strcmp(A,'YZY')
    RIB=RY(T3)*RZ(T3)*RY(T3);
elseif strcmp(A,'ZXY')
    RIB=RY(T1)*RX(T2)*RZ(T3);
elseif strcmp(A,'ZYX')
    RIB=RX(T1)*RY(T2)*RZ(T3);
elseif strcmp(A,'ZXZ')
    RIB=RZ(T1)*RX(T2)*RA(T3);
elseif strcmp(A,'ZYZ')
    RIB=RZ(T1)*RY(T2)*RZ(T3);
else
    RIB=disp('InValid Squence');
end

end