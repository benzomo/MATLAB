function [ Cf,x ] = Reaction1( Ci, C0, D, k,L, Nx, Nt,t)

hx=L/(Nx-1);
ht=t/Nt;

for i=1:Nx+1
    Cold(i)=Ci;
end 

Cold(1)=C0;

for i=1:Nx
    Cb(i)=Cold(Nx+1-i);
end 

for j=1:Nt
    
    C(1)=Cold(1);
    
    for i=2:Nx
        C(i)=2*ht*(D/hx^2*(Cold(i+1)+ Cold(i-1) +2*Cold(i))-k*Cold(i)*Cb(i))+Cold(i);
    end
    for i=2:Nx
        Cold(i)=C(i);
    end
    Cold(Nx+1)=C(Nx-1);
end
for i=1:Nx
    Cf(i)=C(i);
    x(i)=(i-1)*hx;
end  
end



