function [ RY ] = RY( T2 )
%ROTATION ABOUT Y-AXIS, BODY FRAME
%   T2, angle, in degree
RY=[cosd(T2) 0 -sind(T2);...
    0 1 0;
    sind(T2) 0 cosd(T2)]; %R2=Ry(T2)
end

