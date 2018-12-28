function [ B ] = SimpleB5( r,teta,phi,dfy )
%-------------------------------------------------------------------------%
%SIMPLE EARTH'S MAGNETIC FIELD MODEL
%   less precise, data source from IGRF 2015 data
%   for n=1 and m=0,1
%   source from : https://www.ngdc.noaa.gov/geomag/data.shtml
% Output in Locac Tangent Coordinates
%   B = Earth Magnetic Model
%   B = [Br Bt Bp]
%   Br is B in r direction
%   Bt is B in teta direction
%   Bp is B in phi direction
%Input
%   teta =long = Longitude(degree)
%   phi =lat = Latitude(degree)
%   r = alt = Altitude(km), meansure from center of Earth
%   Re=Earth Mean Radius
%   d=day fraction after epoch , 1 January 2000
%-------------------------------------------------------------------------%

Re=6378.148; %km
ratio=Re/r;

%to avoid singuarities
if (teta>-0.000000001 && teta<-0.000000001)
    teta=0.000000001;
elseif(teta<180.00000001 && teta>179.00000001)
    teta=179.99999999;
end
%-------------------------------------------------------------------------%

%co-latitude
colat=90-teta;
nLat=colat*0.017453292519943;
eLong=phi*0.017453292519943;
s1=sin(nLat); c1=cos(nLat);
s2=sin(eLong); c2=cos(eLong);

%coef
g10=-29442.0+(10.3*dfy); %plus sclura variation
g11=-1501.0+(18.1*dfy);
h11=4797.1+(-26.6*dfy); %all unit in nT
%normalisasi, Snm, couse S10 = 1 and S11 = 1 
%all value of g10,g11,h11, constant

%-------------------------------------------------------------------------%
%simple earth magnetic field model
Br=2*(ratio^3)*...
    ((g10*c1)+(g11*c2*s1)+...
    (h11*s2*s1));
Bt=(ratio^3)*...
    ((g10*s1)-(g11*c2*c1)-...
    (h11*s2*c1));
Bp=(ratio^3)*...
    ((-g11*s1*s2)+(h11*s1*c2));
%-------------------------------------------------------------------------%

%so
B=[Br; -Bt; (-1/s1)*Bp];
end