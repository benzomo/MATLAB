function [ G ] = Flash( z,K,Lf )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N=length(z);
G=0;

for i=1:N

    G= G+ z(i)/(K(i)+Lf*(1-K(i))) - z(i)*K(i)/(K(i)+Lf*(1-K(i)));
     
end

end

