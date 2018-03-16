function [ y_hat,y ] = mean_response( x,beta_star,C,e)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n=length(e(:,1));
nx=length(x(:,1));
X=[ones(1,nx);x']';
p=length(X(1,:));
t=-tinv(.025,n-p);
y_hat=zeros(nx,2);
y=zeros(nx,2);

for i=1:nx

    X0=X(i,:)';
    phi=(sum(e.^2)/(n-p)*X0'*C*X0).^0.5;
    phi_t=(sum(e.^2)/(n-p)*(X0'*C*X0 + 1)).^0.5;
    y_hat(i,1)= beta_star'*X0-t*phi;
     y_hat(i,2)= beta_star'*X0+t*phi;
     y(i,1)= beta_star'*X0-t*phi_t;
     y(i,2)=beta_star'*X0+t*phi_t;
    
end


end




