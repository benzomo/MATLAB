function [ f ] = Quadratic(beta, x )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
n= length(x(:,1));

f=zeros(1,n)';

for i=1:n
    
    f(i)=beta'*[1 x(i,1:4) x(i,1).*x(i,2) x(i,1).*x(i,4) x(i,2).*x(i,3:4) x(i,1:2).^2 x(i,4).^2]'; 

end


end

