function [ RIB ] = DCM_RIB( T1,T2,T3,A )
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

if A==1
    RIB=RZ(T1)*RY(T2)*RX(T3);
elseif A==2
    RIB=RY(T1)*RZ(T2)*RX(T3);
elseif A==3
    RIB=RX(T1)*RY(T2)*RX(T3);
elseif A==4
    RIB=RX(T1)*RZ(T2)*RX(T3);
elseif A==5
    RIB=RZ(T1)*RX(T2)*RY(T3);
elseif A==6
    RIB=RX(T1)*RZ(T2)*RY(T3);
elseif A==7
    RIB=RY(T1)*RX(T2)*RY(T3);
elseif A==8
    RIB=RY(T3)*RZ(T3)*RY(T3);
elseif A==9
    RIB=RY(T1)*RX(T2)*RZ(T3);
elseif A==10
    RIB=RX(T1)*RY(T2)*RZ(T3);
elseif A==11
    RIB=RZ(T1)*RX(T2)*RA(T3);
elseif A==12
    RIB=RZ(T1)*RY(T2)*RZ(T3);
else
    RIB=disp('InValid Squence');
end

end