function [ Cf,x,t ] = Reaction( Ci, C0, D, k,L, Nx,Nt,ht)

hx=L/(Nx-1);

Cold=[C0 Ci*ones(1,Nx)];

C(1)=Cold(1);

for j=1:Nt
    
    for i=2:Nx
        C(i)=ht*(D/hx^2*(Cold(i+1)+ Cold(i-1) -2*Cold(i))-k*Cold(i)*Cold(Nx+1-i))+Cold(i);
    end
    
    Cold=C;
   
    Cold(Nx+1)=C(Nx-1);
end
for i=1:Nx
    Cf(i)=C(i);
    x(i)=(i-1)*hx;
end  

    t=Nt*ht;

end



