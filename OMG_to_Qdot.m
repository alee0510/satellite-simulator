function q_dot   = OMG_to_Qdot( w,q1 )
%CONVERTION FROM ANGULAR VELOCITY TO QUATERNION
%   this block need and looping input and output so maybe there have a
%   singularities
%   OMG=angular velociti
%   with componen = [w1 w2 w3];
%   unit in degree/s
%   q1 have dimention 1x4, q=[q0 q1 q2 q3]
%   for computation let's devine :
%                  q0=q(1), q1=(q2), q2=g(3), q3=q(4)

%lets divine a matrix with dimention 4x3
A=[q1(1) -q1(4) q1(3);...
    q1(4) q1(1) -q1(2);...
    -q1(1) q1(2) q1(1);...
    -q1(2) -q1(3) -q1(4)];

%so, q-dot
q_dot=(0.5).*A.*w;

end