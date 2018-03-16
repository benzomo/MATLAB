function [ T ] = Richardson( x,t,a,Ts,Ti,N )

% determine upper boundary of integration (lower boundary is 0)
s=x/(2*sqrt(a*t));
% determine interval width h
h=s/N;
% determine pi
pi=4*atan(1.0);
% initialize the integral to zero
inh=0;
inh2=0;
% build up the integral in N steps
for i=1:N
   u1=(i-1)*h;
   u2=i*h;
% for each interval, add an amount to the integral
% trapezoidal rule: h*(f1+f2)/2
   inh=inh+0.5*h*(exp(-u1*u1)+exp(-u2*u2));
end 
   N=2*N;
   h=s/N;
 % cut h in half by doubling N and evaluate integral  
for i=1:N
   u1=(i-1)*h;
   u2=i*h;
% for each interval, add an amount to the integral
% trapezoidal rule: h*(f1+f2)/2
   inh2=inh2+0.5*h*(exp(-u1*u1)+exp(-u2*u2));

end

%apply Richardson extrapolation


in=inh+(2*h)^2*(inh-inh2)/(h^2-(2*h)^2);

T=Ts+(Ti-Ts)*2*in/sqrt(pi);
end

