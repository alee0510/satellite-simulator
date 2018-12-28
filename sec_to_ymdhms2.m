function [ ctime ] = sec_to_ymdhms2( time )
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

%so time given by
ctime=[yyyy; mm; d;];
end

