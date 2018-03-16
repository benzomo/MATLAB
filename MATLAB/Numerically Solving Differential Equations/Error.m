function [E] = Error(h)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

x=0:h:2;
y=exact(x,h);
y1=Euler(h);  
E=max(abs(abs(y1)-abs(y)));
    

end

