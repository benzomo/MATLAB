syms mcold mhot msteam m1 T1 T2 T3 Tcold Thot h1 h2 h3;
v=[h1 h2 h3 T1 T2 T3 Tcold Thot mcold mhot msteam m1];

%Tank 1: Mass Balance
rho = 1000; A = pi/4*.18^2; k1 = .05/sqrt(.2);
fh1=mhot/(rho*A)-k1*sqrt(h1)/(rho*A);
f1=jacobian(fh1);

pretty(f1)

%Tank 1: Energy Balance
rho = 1000; A = pi/4*.18^2; 
F= 0.9567;H = 2100; C = 4.1855;
fT1 = mhot*(Thot-T1)/(rho*A*h1)+msteam*F*H/(C*rho*A*h1);
f2=jacobian(fT1, v);

pretty(f2)

%Tank 2&3: Mass Balance
rho = 1000; A = pi/4*.18^2; k1 = .05/sqrt(.2); k2 = .1/sqrt(.2);
fh2 = (k1*sqrt(h1)+mcold-k2*sqrt(h2))/(2*rho*A);
f3 = jacobian(fh2, v);

pretty(f3)

%Tank 2: Energy Balance
rho = 1000; A = pi/4*.18^2; 
fT2=m1*(T1-T2)/(rho*A*h2);
f4=jacobian(fT2,v);


pretty(f4)

%Tank 3: Energy Balance
rho = 1000; A = pi/4*.18^2; 
fT3=mcold*(Tcold-T3)/(rho*A*h3);
f5=jacobian(fT3,v);

pretty(f5)

Tcold=4; T3=4; h3=.2; mcold =.05; T1=70; T2 =70; h2=.2; m1=.05; h1=.2; h2=.2; mcold=.05; Thot = 30; T1 = 70; h1 = .2; mhot = .05; msteam = 15/3600; mhot = .05; h1 = .2;