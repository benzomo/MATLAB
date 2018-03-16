function [ Cf,x,t ] = Rxn( Ci, C0, D, k,L, Nx,Nt,ht)

hx=L/(Nx-1);

Cold=[C0 Ci*ones(1,Nx)];

C(1)=Cold(1);

for j=1:Nt
    
    C1=f(Cold,hx,D,Nx,k );
    C2=f(Cold + ht/2*[0 C1(2:Nx+1)],hx,D,Nx,k);
    C=Cold + ht*[0 C2(2:Nx+1)];
    
    
    Cold=C;
   
    Cold(Nx+1)=C(Nx-1);
end
for i=1:Nx
    Cf(i)=C(i);
    x(i)=(i-1)*hx;
end  

    t=Nt*ht;

end



