function [ Psat ] = shortcut( Pc,Tc,w,T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Psat= Pc*10.^(7/3*(w+1)*(1-Tc/T));

end

