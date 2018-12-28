function out  = a_and_p(u,P,e)
%#CALCULATED SEMIMAJOR AXIS AND SEMILACTUS RECTUM
%semimajor axis, a
a=(u*((P/(2*pi))^2))^1/3; %u=myu

%semilatus rectum, p
p=a*(1-e^2);

%output
out=[a p];
end