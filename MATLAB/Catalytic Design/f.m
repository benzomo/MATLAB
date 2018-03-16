function [ Cf ] = f( C,h,D,Nx,k )
%F Summary of this function goes here
%   Detailed explanation goes here

Cf=C;

for i=2:Nx
    Cf(i)=D/h^2*(C(i+1)+ C(i-1)-2*C(i))-k*C(i)*C(Nx+1-i);  
end


end

