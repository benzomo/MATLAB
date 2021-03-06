
function [ Cf,x ] = Catalytic( Ci,L,D,k,tmax,Nt,Nx)

hx=L/(Nx-1);
ht=tmax/(Nt-1);
 
Co=zeros(1,Nx+1);
Co(1)=Ci;

for j=1:Nt
    
    Cnew(1)=Ci;
    
    for i=2:Nx
        Cnew(i)=Co(i)+(D*(Co(i+1)+Co(i-1)-2*Co(i))/hx^2-k*Co(i)*Co(Nx+1-i))*ht;
    end
    
    for i=2:Nx
        Co(i)=Cnew(i);
    end
   
    Co(Nx+1)=Co(Nx-1);
    
end  
    
    
 
for i=1:Nx
    x(i)=(i-1)*hx;
    Cf(i)=Cnew(i);
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

