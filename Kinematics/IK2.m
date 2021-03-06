clc
clear all

%  syms Rxx Rxy Rxz Ryx Ryy Ryz Rzx Rzy Rzz 
 
% syms Tx Ty Tz

% T = [Rxx Rxy Rxz Tx
%      Ryx Ryy Ryz Ty
%      Rzx Rzy Rzz Tz
%      0 0 0 1]

T = [1 0 0 45
     0 1 0 -4
     0 0 1 -135
     0 0 0 1]

Px = T(1,4);
Pz = T(3,4);

A = 15;D = -24;B = -78;

p0 = [0;0;0];
R0 = [1 0 0;0 1 0;0 0 1];
R6 = T(1:3,1:3);
p6 = T(1:3,4);

p1 =  p0 + R0*[A,D,B]';
r = R6'*(p1-p6);
rx = r(1); ry=r(2);rz=r(3);
C = rx^2+ry^2+rz^2;

t3 = -acos((45^2+42^2-C)/(2*45*42))+pi;

alpha = asin((45*sin(pi-t3))/sqrt(C));

t5 = atan2(ry,rz);
t4 = -atan2(rx,sqrt(ry^2+rz^2))-alpha;
% t4 = -atan2(rx,sign(rx)*sqrt(rx^2+ry^2))-alpha;

Rx5 = [1 0 0;0 cos(t5) -sin(t5);0 sin(t5) cos(t5);];
Ry34 = [cos(t3+t4) 0 sin(t3+t4); 0 1 0;-sin(t3+t4) 0 cos(t3+t4);];
RA = R0'*R6*Rx5'*Ry34';

R11 = RA(1,1);R12 = RA(1,2);R13 = RA(1,3);
R21 = RA(2,1);R22 = RA(2,2);R23 = RA(2,3);
R31 = RA(3,1);R32 = RA(3,2);R33 = RA(3,3);

t0 = 0;
t1 = atan2(R32,-R12*sin(t0)+R22*cos(t0));
t2 = atan2(-R31,R33);

% t1 = rad2deg(eval(t1));
% t2 = rad2deg(eval(t2));
% t3 = rad2deg(eval(t3));
% t4 = rad2deg(eval(t4));
% t5 = rad2deg(eval(t5));

[t1,t2,t3,t4,t5]

% M = inv(T0)* inv(T1)*T;
%  E = M(1,4);
%  F = M(3,4);
 
%  theart3 = atan(-(F*(42*cos(t3)+45)+E*42*sin(t3)),E*(42*cos(t3)+45)-F*42*sin(t3));
%  subs(theart3)
% rad2deg(eval(theart3))