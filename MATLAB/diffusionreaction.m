function [ c, x, y ] = diffusionreaction( cleft, cright, ctop, cbottom, D, kp, Lx, Ly, Nx, Ny)

delx=Lx/(Nx+1);
dely=Ly/(Ny+1);
% determine the x and y coordinates of the grid
% x(1,1)=0, y(1,1)=0, x(Nx+2,Ny+2)=Lx, y(Nx+2,Ny+2)=Ly
for i=1:Nx+2
    for j=1:Ny+2
        x(i,j)=(i-1)*delx;
        y(i,j)=(j-1)*dely;
    end
end 
% We are going to solve
% [M]cv=b 
% with [M] the system matrix, cv the concentrations vector, and b
% the right-hand-side containing the boundary conditions).
% First fill the system matrix [M] with zeros.
for i=1:Nx*Ny
    for j=1:Nx*Ny
        M(i,j)=0;
    end
end
% add the diagonal elements to [M] 
for i=1:Nx*Ny
    M(i,i)=-2*D*(1/(delx*delx)+1/(dely*dely))-kp;
end

% enter the side-diagonal elements
% this is quite involved, do not worry too much about it
for i=2:Nx*Ny
    M(i,i-1)=D/(delx*delx);
end
for i=Nx+1:Nx:Nx*Ny
    M(i,i-1)=0;
end
for  i=1:Nx*Ny-1
    M(i,i+1)=D/(delx*delx);
end
for i=Nx:Nx:Nx*Ny-1
    M(i,i+1)=0;
end
for i=Nx+1:Nx*Ny
    M(i,i-Nx)=D/(dely*dely);
end
for i=Nx+1:Nx*Ny
    M(i-Nx,i)=D/(dely*dely);
end

% first fill the right-hand side vector b with zero's
for i=1:Nx*Ny
    b(i)=0;
end

% add to vector b the contributions from the boundary conditions
for i=1:Nx
    b(i)=b(i)-D*cbottom/(dely*dely);
end
for i=Nx*Ny-Nx+1:Nx*Ny
    b(i)=b(i)-D*ctop/(dely*dely);
end
for i=1:Nx:Nx*Ny
    b(i)=b(i)-D*cleft/(delx*delx);
end
for i=Nx:Nx:Nx*Ny
    b(i)=b(i)-D*cright/(delx*delx);
end

% Here the linear system is solved, cv is the (so far unknown)
% concentration vector.
% This is a typical Matlab statement: since [M]*cv=b we write cv=M\b'.
% Do not worry how the system is solved.

cv=M\b'

% Now the column vector cv is transformed in a concentration filed c at position i,j
k=0;
for j=2:Ny+1
    for i=2:Nx+1
        k=k+1;
        c(i,j)=cv(k);
    end
end

% The boundary values are added to the c field
for i=2:Nx+1
    j=1;
    c(i,j)=cbottom;
    j=Ny+2;
    c(i,j)=ctop;
end
for j=2:Ny+1
    i=1;
    c(i,j)=cleft;
    i=Nx+2;
    c(i,j)=cright;
end
c(1,1)=0.5*(cbottom+cleft);
c(1,Ny+2)=0.5*(ctop+cleft);
c(Nx+2,1)=0.5*(cbottom+cright);
c(Nx+2,Ny+2)=0.5*(ctop+cright);


end

