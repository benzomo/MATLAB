% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File:    pendulum.m
% Purpose: solve linear pendulum motion according to Euler method
% USAGE  : [ teta ] = pendulum(teta0,g,L,h,N)
% Input:   teta0        = initial angle
%          g            = gravitational acceleration
%          L            = length
%          h            = time step size
%          N            = number of time steps
%          
% Output:  teta         = N-long vector containing teta as a function of
%                         time
%          t            = N-long vector containing time
%	       
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ Ek,Ep,Et,Analytic,omega,teta,t ] = pendulum(teta0,g,L,h,N)
% combine g and L in a single parameter alfa
alfa=g/L;
% initialize y1 (omega), and y2 (teta)
y1=0;
y2=teta0;
% undertake N time steps
for i=1:N
    y1nw=y1-h*alfa*sin(y2+h/2*y1);
    y2nw=y2+h*(y1-h/2*alfa*sin(y2));
    y1=y1nw;
    y2=y2nw;
% store teta and time in a vector for visualization later
    omega(i)=y1;
    teta(i)=y2;
    t(i)=i*h;
    
end

Analytic(1,:)= -teta0*sqrt(alfa)*sin(t.*sqrt(alfa));
Analytic(2,:)=teta0*cos(t.*sqrt(alfa));
Ek =0.5*L^2*omega.^2;
Ep=g*L*(1-cos(teta));
Et=Ek +Ep;

end



