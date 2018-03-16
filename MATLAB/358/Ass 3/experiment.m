function [ y ] = experiment( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N=length(x(:,1));
y=zeros(1,N);

for i=1:N
    
    y(i)=f(x(i,:));
    
end

y=y';

end

