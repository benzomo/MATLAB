function [ y ] = P( c,xd,D,S,W )
%F Summary of this function goes here
%   Detailed explanation goes here
y= c(1)*(xd-60) +c(2)*D-(c(3)*S+c(4)*W);


end

