function [ T ] = Simpson3Q(x, t, a, Ts, Ti, N)
% determine upper boundary of integration (lower boundary is 0)
s=x/(2*sqrt(a*t));
% determine interval width h
h=s/N;
% determine pi
pi=4*atan(1.0);
% initialize the integral to zero
in=0;
% build up the integral in N steps
for i=1:2:N
   u1=(i-1)*h;
   u2=i*h;
   u3=(i+1)*h;
% for each interval, add an amount to the integral
% trapezoidal rule: h*(f1+f2)/2
   in=in+(h/3)*(exp(-u1*u1)+4*exp(-u2*u2)+exp(-u3*u3));
end
% use the integral to calculate the temperature
T=Ts+(Ti-Ts)*2*in/sqrt(pi);
end
   