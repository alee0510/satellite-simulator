function [alt, long, lat] = XYZtoALL(xG,yG,zG)
%#codegen
%alttitude
alt=((xG^2)+(yG^2)+(zG^2))^0.5;

%longitude
long=atand(yG/xG);

%latitude
lat=atand(zG/(((xG^2)+(yG^2))^0.5));

end