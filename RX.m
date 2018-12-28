function [ RX ] = RX( T1 )
%ROTATION ABOUT X-AXIS, BODY FRAME
%   T1, angle, in degree
RX=[1 0 0;...
    0 cosd(T1) sind(T1);...
    0 -sind(T1) cosd(T1)]; %R1=Rx(T1)
end

