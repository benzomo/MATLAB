function [ z ] = exact( x,h )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

N=2/h;

for i=1:N+1

    z(i)=y(x(i));
    
end
    
end

