%% Copyright (c) 2009, Richard Rieber
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without 
% modification, are permitted provided that the following conditions are 
% met:
% 
%     * Redistributions of source code must retain the above copyright 
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright 
%       notice, this list of conditions and the following disclaimer in 
%       the documentation and/or other materials provided with the distribution
%       
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
% POSSIBILITY OF SUCH DAMAGE.

%% Orbital Mechanics Library, on MATLAB Central File Exchange
% Richard Rieber
% September 26, 2006
% rrieber@gmail.com
%
% function [R,V] = randv(a,ecc,inc,Omega,w,nu,U)
% 
% Purpose:  This function converts Kepler orbital elements (p,e,i,O,w,nu)
%           to ECI cartesian coordinates in km
%           This function is derived from algorithm 10 on pg. 125 of
%           David A. Vallado's Fundamentals of Astrodynamics and 
%           Applications (2nd Edition)
% 
% WARNING:  o If the orbit is near equatorial and near circular, set w = 0 and Omega = 0
%             and nu to the true longitude.
%           o If the orbit is inclined and near circular, set w = 0 and nu to the argument
%             of latitude.
%           o If the orbit is near equatorial and elliptical, set Omega = 0 and w to the true
%             longitude of periapse.
% 
% Inputs:  a:     Semi-major axis in km of length n
%          ecc:   Eccentricity of length n
%          inc:   Inclination of orbit in radians of length n
%          Omega: Right ascension of ascending node in radians of length n
%          w:     Argument of perigee in radians of length n
%          nu:    True anomaly in radians of length n
%          U:     Gravitational constant of body being orbited (km^3/s^2).  Default is Earth
%                 at 398600.4415 km^3/s^2.  OPTIONAL
%
% Outputs: R:  3 x n array of the radius in km
%          V:  3 x n array of the velocity in km/s

function [R,V] = randv(a,ecc,inc,Omega,w,nu,U)

if nargin < 6 || nargin > 7
    error('Number of inputs incorrect.  See help randv')
elseif nargin == 6
    U = 398600.4415; %Gravitational Constant for Earth (km^3/s^2)
end

if length(a) ~= length(ecc) && length(a) ~= length(inc) && length(a) ~= length(Omega)...
        && length(a) ~= length(w) && length(a) ~= length(nu)
    error('Input vectors are not the same size.  Check inputs')
end

for j = 1:length(a)
    p = a(j)*(1-ecc(j)^2);
    
    % CREATING THE R VECTOR IN THE pqw COORDINATE FRAME
    R_pqw(1,j) = p*cos(nu(j))/(1 + ecc(j)*cos(nu(j)));
    R_pqw(2,j) = p*sin(nu(j))/(1 + ecc(j)*cos(nu(j)));
    R_pqw(3,j) = 0;
    
    % CREATING THE V VECTOR IN THE pqw COORDINATE FRAME    
    V_pqw(1,j) = -(U/p)^.5*sin(nu(j));
    V_pqw(2,j) = (U/p)^.5*(ecc(j) + cos(nu(j)));
    V_pqw(3,j) = 0;
    
    % ROTATING THE pqw VECOTRS INTO THE ECI FRAME (ijk)
    R(:,j) = R3(-Omega(j))*R1(-inc(j))*R3(-w(j))*R_pqw(:,j);
    V(:,j) = R3(-Omega(j))*R1(-inc(j))*R3(-w(j))*V_pqw(:,j);
end

function C = R1(x)

C = [1      0       0;
     0      cos(x)  sin(x);
     0      -sin(x) cos(x)];
 
 function C = R2(x)

C = [cos(x)  0      -sin(x);
     0       1      0;
     sin(x)  0      cos(x)];
 
 function C = R3(x)

C = [cos(x)  sin(x)     0;
     -sin(x) cos(x)     0;
     0       0          1];