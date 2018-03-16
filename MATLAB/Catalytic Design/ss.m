function [ tss ] = ss( Ci, C0, D, k,L, Nx,ht )
%SS Summary of this function goes here
%   Detailed explanation goes here
Cold=[C0 Ci*ones(1,Nx)];

    C(1)=Cold(1);


for i=10:10:100000
    
    [C,x,t]=Rxn (Ci, C0, D, k,L, Nx,i,ht);
    
    diff=C-Cold;
    
    if (diff<0.001*ones(1,Nx))
        tss=t;
    end
    Cold=C;
end

end

