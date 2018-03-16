function [ X ] = maximize(C0,tau,increment,kp,kq,x,cn,E)

tauMAX=tau;
cnmax=0;
MAX=x;

x=reactor(C0,C0,tau,kp,kq,x,E);

    while(x(4)/x(3)<cn)
    
    x=reactor(C0,C0,tau,kp,kq,x,E);
    if(2*x(3)/C0 > cnmax)
      
        tauMAX=tau;
        cnmax=2*x(3)/C0;
        MAX=x;
    end
 	tau=tau + increment;
    
    end

X=MAX
TauMAX=tauMAX
cn=x(4)/x(3)
cnMAX=cnmax

%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here




end

