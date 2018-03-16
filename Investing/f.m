function [ dydx ] = f( x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if(x==0)
    dydx=1;

else
    dydx=(1/x -2*x)*y;


end

