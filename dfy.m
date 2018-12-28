function [ dfy ] = dfy( y,m,d,h,mi,s )
%-------------------------------------------------------------------------%
%THIS PROGRAM TO CALCULATED DATENUM TO DECIMAL
%   A serial date number represents the whole and fractional number of days
%   from a fixed, preset date (January 0, 0000).
%   Nomeclatur Symbol :
%INPUT  :
%   y  = years
%   m  = minutes
%   d  = secons
%   h  = hours
%   mi = minutes
%   s  = secons
%   all unit in decimal.
%OUTPUT :
%   dfy in decimal, day fraction in years unit
%-------------------------------------------------------------------------%

%make initial arrya
a=[y m d h mi s];

%calculated datenumber in decimal
b=datenum(a);
c=b/365; %asume, 1 years = 365 days
d=c-2000;
dfy=d;
end
%-------------------------------------------------------------------------%