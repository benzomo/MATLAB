function [ X ] = backw( E,F,del,X0,k,Ca0 )
%BACKW Summary of this function goes here
%   Detailed explanation goes here
N=length(E);
X=zeros(1,N);
X(N)=X0;

for i=N-1:-1:1
    
    X(i)= X(i+1)+ -del*(-k*Ca0*(1-X(i+1))^2 +X(i+1)*E(i+1)/(1-F(i+1)));
    
    
end


end
