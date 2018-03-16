function [ f ] = friction( e,D,Re )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

a=(e/D)/3.7 + 5.74/Re.^0.9;
f=0.0625/(log10(a).^2);


end

