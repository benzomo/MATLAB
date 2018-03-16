function y=Viscosity(theta,xdata)


C=theta(1);
S=theta(2);

y=C*xdata.^1.5./(xdata+S);
