function Q   = EulrPar_to_Q( a1,a2,a3,teta )
%CALCULATE QUATERNION FROM EULER PARAMETER
%   This program calculated quaternion if given an euler parameter\
%   Q = quaternion, have a component 
%   Q = [q0 q1 q2 q3]
%   and Euler parameter, a = Euler Axis, dimention 1x3
%                        teta = Euler Angle, degree

%Quaternion
Q=[cosd(teta/2); a1*sind(teta/2); a2*sind(teta/2); a3*sind(teta/2)];

end