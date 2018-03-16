function [ tss ] = StSt( Ci, C0, D, k,L, Nx,ht )
%SS Summary of this function goes here
%   Detailed explanation goes here
Cold=[C0 Ci*ones(1,Nx-1)];

    C(1)=Cold(1);


for i=1000:1000:100000
    
    [C,x,t]=Rxn (Ci, C0, D, k,L, Nx,i,ht);
    
    diff=C-Cold;
    
    if (size(diff)<0.1)
        tss=t;
        break;
    end
    Cold=C;
end

end

