clear
clc

a=[-.5 0; 1 -2]; b=[.5 0]';
t=.1; tau=0;
T=t-tau;
a1 = eye(2); a2 = eye(2)*T; a3 = eye(2)*tau;
a1 = eye(2)+a*t;

for i=2:1000   
a1 = a1 + (a*t)^i/factorial(i);
a2 = a2 + T^i*a^(i-1)/factorial(i);
end

omega1 = a1
rho1 = a2*b

