function ctime   = read_epochS( epoch )
%CONVERT EPOCH TIME DATA FROM TLE TO NORMAL DATE
%   epoch format : 
%   example : 16092.07183861
%   source : http://www.satobs.org/element.html
%   valid for after century, of after 2000
%
%The epoch date is the third element (96198.95303667) in line 1 of the TLE.
%The epoch is the sequential calendar date when the satellite crossed the 
%equator in an ascending (northerly) direction subsequent to a series of 
%observations that were made to calculate the elements. 
%In the above example,observations were made near the time on which 
%the satellite was calculated to have crossed the equator on calendar date
%198.95303667 in the year 1996.Universal Time (UT), formally known 
%as Greenwich Mean Time (GMT),is the time standard used. 
%Jim Varney explains the concept in a responseto a question found
%in the SeeSat-L e-mail archive.

%Specifically, the equatorial crossing was calculated for day 198 of the 
%year 1996 at 22:52 UT [24 (hours) x 0.95303667 = 22.87288 hours, 
%and 60 (minutes) x 0.87288 = 52.3728 minutes]. Most tracking programs will
%inform the user how old the element is by using the epoch date element. 
%This tells the user if an old and possibly unreliable TLE is being used. 

%convert input to string
in=num2str(epoch);
yy=in(1:2);
dd=in(3:5);

%calculate year, y
a=str2double(yy);
y=2000+a;%years

%calculated day
b=str2double(dd); %days

%fractional portion of the day
e=epoch-fix(epoch); %secons

%epoch given in secons
ctime=(y*365*24*60*60)+(b*24*60*60)+e;
end