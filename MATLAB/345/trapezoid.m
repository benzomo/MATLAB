function [ I ] = trapezoid( x,y)
%SIMPSONS Summary of this function goes here
%   Detailed explanation goes here

N=length(x);
I=0;


for i=2:N
   f=0.5*(x(i)-x(i-1))*(y(i)+y(i-1));
   I=I+f;
end
     
end





