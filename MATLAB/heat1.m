
function [ T,x ] = heat( T0, q, lamda, rhocp, A, L, h, N, M, delt)

delx=L/(N-1);
for i=1:N+1
    Told(i)=T0;
end    

for j=1:M
    for i=2:N
        Th(i)=Told(i)+q*delt/(rhocp*A)+lamda*delt*(Told(i+1)-2*Told(i)+Told(i-1))/(rhocp*delx*delx);
    end
    for i=2:N+1
        Told(i)=Th(i);
    end
    Told(N+2)=Th(N);
    Told(1)=Th(3)+2*h*delx*(T0-Th(2))/lamda;
end
for i=1:N
    T(i)=Th(i+1);
    x(i)=(i-1)*delx;
end  

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File:    heat.m
% Purpose: solve a 1D instatationary heat conduction problem
% USAGE  : [ T,x ] = heat( T0, q, lamda, rhocp, A, L, h, N, M, delt)
% Input:   T0           = initial temp 
%          q            = supplied heat per unit length
%          lamda, rhocp = material properties
%          A, L         = cross sectional area and length
%          h            = heat transfer coeff at x=0
%          N,M          = number of grid points and time steps
%          delt         = time step size
% Output:  T            = temp field after M time steps
%	       
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

