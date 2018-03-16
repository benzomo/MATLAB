function [ Lmax ] = Max( Ci, C0, D, k,Nx,Nt,ht )
%SS Summary of this function goes here
%   Detailed explanation goes here

for i=0.1:0.005:.2
    
    [C,x,t]=Rxn (Ci, C0, D, k,i, Nx,Nt,ht);
    
    if (C(Nx)<0.001)
       for j=i-.005:0.0001:i
           [C,x,t]=Rxn (Ci, C0, D, k,j, Nx,Nt,ht);
           if (C(Nx)<0.001)
                Lmax=j;
                break;
           end
       end
       break;
    end
end

end

