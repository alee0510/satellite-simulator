function [ R ] = Q_to_R1R2R3( q )
%CONVERTION FROM QUATERNION (q) to ROTATION ANGLE (R1,R2,R3)
%   devine R, rotation angle, with
%   R1, rotation about x axis, roll
%   R2, rotation about y axis, pitch
%   R3, rotation about z axis, yaw
% and q have a compone , q=[q0 q1 q2 q3]
% so q0=q(1), q1=(q2), q2=g(3), q3=q(4), q4=q(5)

%roll
R1=atan2(2*(q(1)*q(2)+q(3)*q(4)),1-2*((q(2)^2)+(q(3)^2)));

%pitch
R2=asind(2*(q(1)*q(3)-q(4)*q(2)));

%yaw
R3=atan2(2*(q(1)*q(4)+q(2)*q(3)),1-2*((q(3)^2)+(q(4)^2)));

%Rotation Angle, valid for 3-2-1 squence or Z-Y-X
R=[R1 R2 R3];

end

