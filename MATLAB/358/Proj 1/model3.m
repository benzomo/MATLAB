function [ f ] = model3( beta, x )
%Y Summary of this function goes here
%   Detailed explanation goes here
n= length(x(:,1));

f=zeros(1,n)';

for i=1:n
    
    f(i)=beta'*[1 x(i,1:2) x(i,1:3).^2]'; 

end

