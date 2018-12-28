function [ ctime ] = sec_to_ymdhms( time )
%TIME CONVERTION
%   Asumstion :
%   1 years = 365 days
%   1 days = 24 hours
%   1 hour = 60 minutes
%   1 minute = 60 secons

% years
yyyy=fix(time/(365*24*60*60));

%month
M=fix(365/(time/(24*60*60)));
if M<1
    mm=1;
elseif M>12
    a=fix(M/12);
    mm=(365/(time/(24*60*60)))-12*a;
else
    mm=M;
end

%day
b=(365/(time/(24*60*60)))-M;
day=fix(b);
if day<1
    d=1;
else
    d=day;
end

%fractional portion of the day
e=b-day;

%calculated hour, min, and secons
h=fix(e*24);
min=abs(fix((e-h)*60));
s=((e-h)*60)-min;
if s<1
    sec=1;
else
    sec=fix(s);
end

%so time given by
ctime=[yyyy; mm; d; h; min; sec];
end

