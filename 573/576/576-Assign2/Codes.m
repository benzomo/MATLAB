clear
clc

a=[1 0; 1 1]; b=[1 0]';
t=.3; tau=.2;
T=t-tau;
a1 = eye(2); a2 = eye(2)*T; a3 = eye(2)*tau;
a1 = eye(2)+a*t;

for i=2:1e4
a1 = a1 + (a*t)^i/factorial(i);
a2 = a2 + T^i*a^(i-1)/factorial(i);
a3 = a3 + tau^i*a^(i-1)/factorial(i);
end

omega1 = a1
rho1 = a2*b
rho2 = expm(a*T)*a3*b
