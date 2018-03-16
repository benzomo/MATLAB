function [ y ] = Euler( h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N=2/h -1;

y=zeros(1,N+2);

for i=0:N
  
   y(i+2)=y(i+1)+ h*f(i*h,y(i+1)); 
   
end

end

