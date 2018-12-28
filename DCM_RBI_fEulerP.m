function [ DCM ] = DCM_RBI_fEulerP( a,OMG )
%DIREC COSINES MATRIX FROM EULER PARAMETER, a and OMG
%   a= Euler Axis, matrix 3x1 [raw,colom]
%   OMG = Euler Aangle

ax=[0 -a(3) a(2);...
    a(3) 0 -a(1);...
    -a(2) a(1) 0]


end

