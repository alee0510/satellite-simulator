function [ RZ ] = RZ( T3 )
%ROTATION ABOUT Z-AXIS, BODY FRAME
%   T3, angle, in degree
RZ=[cosd(T3) sind(T3) 0;...
    -sind(T3) cosd(T3) 0;...
    0 0 1]; %R3=Rz(T3)
end

