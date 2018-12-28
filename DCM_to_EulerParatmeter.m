function [ B ] = DCM_to_EulerParatmeter( DCM )
%CONVERTION FROM DIREC COSINES MATRIX TO EULER PARAMETER
%   dcm has 3x3 dimention
%   euler parameter, a=euler axis, have 3x1 componen
%   and Teta=Euler angle, in degree
B=zeros(4,1);

%define R=Trace(DCM)
R=trace(DCM);

%define A=[r23-r32; r31-r13; r12-r21]
A=[DCM(2,3)-DCM(3,2);...
    DCM(3,1)-DCM(1,3);...
    DCM(1,2)-DCM(2,1)];

%euler angle, T
T=acosd((R-1)/2);

%euler axis, a
a=(1/2*sind(T))*A;

B(1)=T;
B(2)=a(1);
B(3)=a(2);
B(4)=a(3);

end