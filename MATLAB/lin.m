function [ c ] = lin(x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

b=[sum(y) sum(x.*y)];

N=length(x);

    S(1,1)=N;
    S(1,2)= sum(x);
    S(2,1)= sum(x);
    S(2,2)= sum(x.^2);


c=S\b';

end

