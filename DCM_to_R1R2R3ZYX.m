function [ R ] = DCM_to_R1R2R3ZYX( DCM )
%CONVERTION FROM DIREC COSINES MATRIX TO ROTATION ANGLE
%   DCM with dimention 3x3
%   convert to Rotation angle, in degree
% devine R, rotation angle, with
%   R1, rotation about x axis, roll
%   R2, rotation about y axis, pitch
%   R3, rotation about z axis, yaw

%roll, R1
R1=atand(DCM(1,2)/DCM(1,1));

%picth, R2
R2=-asind(DCM(1,3));

%yaw, R3
R3=atand(DCM(2,3)/DCM(3,3));

%so, Rotation Angle give by
R=[R1; R2; R3];

end

