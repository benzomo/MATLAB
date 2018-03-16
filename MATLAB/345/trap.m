function [ I ] = trap( x,y,a,b )
%SIMPSONS Summary of this function goes here
%   Detailed explanation goes here

N=length(x);
I=0;
Na=length(a);
 
for i=1:N
    
     if(i~=Na)
        I=[I 0];
     end
     
    for k=1:N-1
        if(a(i)==x(k))
            j=k;
        end
    end
 
    for k=j:N
    
        if(x(k)==b(i))
            break;
        end
        
        int=(x(k+1)-x(k))*(y(k)+y(k+1))/2;
        I(i)=I(i) + int;
    end
    
    if(i==Na)
    break;
    end
end
end






