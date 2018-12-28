function [ OE ] = ReadTLE( mu )
%READ TLE DATA FROM TEXT FORMAT
%   data TLE : form celestrack.com
%%
% Two-line element set
load LAPANA2


epoch = L2(1,4)*24*3600;        % Epoch Date and Julian Date Fraction
Db    = L2(1,5);                % Ballistic Coefficient
inc   = L3(1,3);                % Inclination [deg]
RAAN  = L3(1,4);                % Right Ascension of the Ascending Node [deg]
e     = L3(1,5)/1e7;            % Eccentricity 
w     = L3(1,6);                % Argument of periapsis [deg]
M     = L3(1,7);                % Mean anomaly [deg]
n     = L3(1,8);                % Mean motion [Revs per day]
   
% Orbital elements

a = (mu/(n*2*pi/(24*3600))^2)^(1/3);     % Semi-major axis [km]    

% Calculate the eccentric anomaly using Mean anomaly
err = 1e-10;            %Calculation Error
E0 = M; t =1;
itt = 0;
while(t) 
       E =  M + e*sind(E0);
      if ( abs(E - E0) < err)
          t = 0;
      end
      E0 = E;
      itt = itt+1;
end

% Six orbital elements 
OE = [a e inc RAAN w E];
end