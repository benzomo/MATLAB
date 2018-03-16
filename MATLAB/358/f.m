function [ y ] = f( x )
%F Summary of this function goes here
%   Detailed explanation goes here

y=4+3*x(:,1)-4*x(:,2)-x(:,1).^2-x(:,2).^2;


end

