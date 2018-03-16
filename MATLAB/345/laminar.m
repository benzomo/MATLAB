function [ E ] = laminar( t,tau )
%LAMINAR Summary of this function goes here
%   Detailed explanation goes here
N=length(t);
E=zeros(1,N);

for i=1:N

    E(i)=tau^2/2/t(i)^3;
    
    
    if (t(i)<tau/2)
        E(i)=0;
    end
end
end

