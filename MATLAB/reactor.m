function [ x ] = reactor(a0,b0,tau,kp,kq,x0,E)

x=x0;
L=E+1;

while(L>E)
    
    f(1)=a0-2*x(1)-tau*kp*x(1)*x(2)-tau*kq*x(1)*x(3)^2;
    f(2)=b0-2*x(2)-tau*kp*x(1)*x(2);
    f(3)=-2*x(3)+tau*kp*x(1)*x(2)-tau*kq*x(1)*x(3)^2;
    f(4)=-2*x(4)+tau*kq*x(1)*x(3)^2;
    
    df1dx1=-2-tau*kp*x(2)-tau*kq*x(3)^2;
    df1dx2=-tau*kp*x(1);
    df1dx3=-2*tau*kq*x(1)*x(3);
    df1dx4=0;

    df2dx1=-tau*kp*x(2);
    df2dx2=-2-tau*kp*x(1);
    df2dx3=0;
    df2dx4=0;
    
    df3dx1=tau*kp*x(2)-tau*kq*x(3)^2;
    df3dx2=tau*kp*x(1);
    df3dx3=-2-2*tau*kq*x(1)*x(3);
    df3dx4=0;
    
    df4dx1=tau*kq*x(3)^2;
    df4dx2=0;
    df4dx3=2*tau*kq*x(1)*x(3);
    df4dx4=-2;
    
    J=[df1dx1 df1dx2 df1dx3 df1dx4; df2dx1 df2dx2 df2dx3 df2dx4; df3dx1 df3dx2 df3dx3 df3dx4; df4dx1 df4dx2 df4dx3 df4dx4];

    delx=J\-f';
    
    xold=x;
    x=x+delx';
    
    L=sqrt(sum((x-xold).^2));
end
q=x(4)/x(3);
cn=2*x(3)/a0;

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


end

