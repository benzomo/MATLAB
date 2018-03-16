clc
clear

syms mcold mhot msteam m1 T1 T2 T3 Tcold Thot h1 h2 h3;
syms x1 x2 x3 x4 x5 x2 u1 u2 u3;
v=[h1 h2 T1 T2 T3 h3 mcold mhot msteam Tcold Thot m1];

%Tank 1: Mass Balance
rho = 1000; A = pi/4*.18^2; k1 = .05/sqrt(.2);
fh1=mhot/(rho*A)-k1*sqrt(h1)/(rho*A);
Fh1=subs(fh1, [h1 h2 T1 T2 T3 h3 mcold mhot msteam],[x1 x2 x3 x4 x5 x2 u2 u1 u3]);
f1=jacobian(fh1,v);

%Tank 2&3: Mass Balance
rho = 1000; A = pi/4*.18^2; k1 = .05/sqrt(.2); k2 = .1/sqrt(.2);
fh2 = (k1*sqrt(h1)+mcold-k2*sqrt(h2))/(2*rho*A);
Fh2 = subs(fh2, [h1 h2 T1 T2 T3 h3 mcold mhot msteam],[x1 x2 x3 x4 x5 x2 u2 u1 u3]);
f2 = jacobian(fh2, v);

%Tank 1: Energy Balance
rho = 1000; A = pi/4*.18^2; 
F= 0.9567;H = 2100; C = 4.1855;
fT1 = mhot*(Thot-T1)/(rho*A*h1)+msteam*F*H/(C*rho*A*h1);
FT1 = subs(fT1, [h1 h2 T1 T2 T3 h3 mcold mhot msteam],[x1 x2 x3 x4 x5 x2 u2 u1 u3]);
f3=jacobian(fT1, v);

%Tank 2: Energy Balance
rho = 1000; A = pi/4*.18^2; 
fT2=m1*(T1-T2)/(rho*A*h2);
FT2 = subs(fT2, [h1 h2 T1 T2 T3 h3 mcold mhot msteam],[x1 x2 x3 x4 x5 x2 u2 u1 u3]);
f4=jacobian(fT2,v);

%Tank 3: Energy Balance
rho = 1000; A = pi/4*.18^2; 
fT3=mcold*(Tcold-T3)/(rho*A*h3);
FT3 = subs(fT3, [h1 h2 T1 T2 T3 h3 mcold mhot msteam],[x1 x2 x3 x4 x5 x2 u2 u1 u3]);
f5=jacobian(fT3,v);

%evaluate equations
h1 =0.2;	 h2=0.2;	 h3=0.2;	 m1=0.05;	 mcold =0.05;	 mhot =0.05;	 msteam = 15/3600;	 T1 =70;	 T1=70;	 T2 =70;	 T3=4;	 Thot =30;	 Tcold=4;

AB = [eval(f1);eval(f2);eval(f3);eval(f4);eval(f5)];

'h1 h2 T1 T2 T3'
A=[AB(:,1:5)]
'mcold mhot msteam Tcold Thot'
B=[AB(:,7:11)]