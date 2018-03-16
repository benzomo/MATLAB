function [ yi ] = equil( mi,bi,m,b )
%EQUIL Summary of this function goes here
%   Detailed explanation goes here
N=length(m);

for i=1:N
    
 a=[-mi 1;-m(i) 1]\[bi;b(i)]; 
    yi(i)=a(2);
    
end


end

