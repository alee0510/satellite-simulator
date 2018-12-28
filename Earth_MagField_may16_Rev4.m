function [ B ] = Earth_MagField_may16_Rev4( r,teta,phi,dfy )
%EARTH MAGNETIC FIELD MODEL WITH IGRF12 WITH N=13
%-------------------------------------------------------------------------%
% Output in Locac Tangent Coordinates
%   B = Earth Magnetic Model
%   B = [Br Bt Bp]
%   Br is B in radial direction
%   Bt is B in teta direction
%   Bp is B in phi direction
%Input
%   teta = lat  = Latitude(degree)
%   phi  = long = Longitude(degree)
%   r    = alt  = radius(km), meansure from center of Earth
%   Re   = Earth Mean Radius
%   d    = day fraction after epoch , 1 January 2000
% This model base on sherical harmonic model of scalar potential, given by
%   
% V(r,teta,phi)=a*sigma_n=1tok(a/2)^n+1*...
%                  Sigma_m=1ton(gnm*cos(m*phi)+hnm*sin(m*phi))*Pnm(teta)
%
% with teta=co-latitude or ?=90-latitude,
% V(r,teta,phi) in Local Tangnent Coordinat Frame
%-------------------------------------------------------------------------%
load gh_norm_dat gsn hsn
%-------------------------------------------------------------------------%
clc;
%coef
Re=6378.148; %km
ratio=Re/r;
%to avoid singuarities
if (teta>-0.000000001 && teta<-0.000000001)
    teta=0.000000001;
elseif(teta<180.00000001 && teta>179.00000001)
    teta=179.99999999;
end
%-------------------------------------------------------------------------%
%co-latitude, convert from degree to radian
colat=90-teta; %co-latitude
nLat=colat*0.017453292519943; %co-latitude, convert to radian
eLong=phi*0.017453292519943; %longitude
s1=sin(nLat); c1=cos(nLat);
%-------------------------------------------------------------------------%
%splitting data
gn=gsn(:,1); gm=gsn(:,2); gv=gsn(:,3); gsv=gsn(:,4);
hn=hsn(:,1); hm=hsn(:,2); hv=hsn(:,3); hsv=hsn(:,4);
%initial condition
N=13;
g=zeros(N,N+1);
h=zeros(N,N+1);
%change dimention to 13x14
for i=1:length(gn)
    g(gn(i),gm(i)+1)=gv(i)+(gsv(i)*(dfy));
    h(hn(i),hm(i)+1)=hv(i)+(hsv(i)*(dfy));
end
%-------------------------------------------------------------------------%
%Earth Magnetic Field Equation
%   P=Associated Polynom Legendre
%   dP=First Derivative of Associated Polynom Legendre
%nomeclature for the recursive formula
%   P11=P(n-1,m-1), P10=(P(n-1,m-0); P00=(P(n-0,m-0)=1;
%BASE ON SPHERICAL HARMONIC EQUATION
%-------------------------------------------------------------------------%
%initial value
Br=0; Bt=0; Bp=0;
P=zeros(N,N+1);
dP=zeros(N,N+1);
%iteratiron, depend on n degree
for n=1:N
    for m=0:n
        if n==1 && m==0
            P(n,m+1)=c1;
            dP(n,m+1)=-s1;
        elseif n==1 && m==1
            P(n,m+1)=s1;
            dP(n,m+1)=c1;
        elseif n==m % n>1 & m>1
            P(n,m+1)=s1*P(n-1,m);
            dP(n,m+1)=(s1*dP(n-1,m))+(c1*P(n-1,m));
        else % n>1 & m>1
            k=(((n-1)^2)-m^2)/(((2*n)-1)*((2*n)-3));
            if n==2
                P(n,m+1)=c1*P(n-1,m+1)-k; %for case n=0, p(0,m)=1;
                dP(n,m+1)=(c1*dP(n-1,m+1))-(s1*P(n-1,m+1));
            else %n>=3
                P(n,m+1)=c1*P(n-1,m+1)-k*P(n-2,m+1);
                dP(n,m+1)=(c1*dP(n-1,m+1))-(s1*P(n-1,m+1))...
                    -(k*dP(n-2,m+1));
            end
        end
        %---------------------Earth's Magnetic Field----------------------%
        Br=Br+(ratio^(n+2))*(n+1)*...                     % phi = latitude
            (g(n,m+1)*cos(m*eLong)+h(n,m+1)*sin(m*eLong))*P(n,m+1);
        Bt=Bt+(ratio^(n+2))*...
            (g(n,m+1)*cos(m*eLong)+h(n,m+1)*sin(m*eLong))*dP(n,m+1);
        Bp=Bp+(ratio^(n+2))*...
            (m*(-g(n,m+1)*sin(m*eLong)+h(n,m+1)*cos(m*eLong)))*P(n,m+1); 
        %-----------------------------------------------------------------%
    end
end
%------------Earth's Magnetic Field in Local Tangent Coordinate-----------%
B=[Br; -Bt; (-1/s1)*Bp];
end