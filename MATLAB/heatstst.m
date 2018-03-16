function [ T,x ] = heatstst( T0, q, lamda, A, L, h, N)

for i=1:N
    x(i)=(i-1)*L/(N-1);
    T(i)=T0+q*(L*x(i)-0.5*x(i)*x(i))/(A*lamda)+q*L/(A*h);
end




%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File:    heatstst.m
% Purpose: analytical solution to 1D steady state heat conduction problem
% USAGE  : [ T,x ] = heatstst( T0, q, lamda, A, L, h, N)
% Input:   T0           = initial temp (deg C)
%          q            = supplied heat per unit length (J/m)
%          lamda        = heat conduction coeff (W/m*deg C)
%          A, L         = cross sectional area and length (m^2)
%          h            = heat transfer coeff at x=0 (J/m^2*deg C)
%          N            = number of points
% Output:  T            = steady state temp field (vector with length N
%          x            = corresponding x positions
%	       
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

