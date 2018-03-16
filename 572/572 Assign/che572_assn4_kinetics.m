function r=kinetics(b,x)
r=b(1)*x(:,1).*x(:,2)./(1+b(2)*x(:,1).^2);