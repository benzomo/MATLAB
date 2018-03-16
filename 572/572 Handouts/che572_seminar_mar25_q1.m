xdata=[-20:20:160]'+273.15

ydata=0.1416*xdata.^1.5./(xdata+74)+randn(10,1)*0.01;

y=0.1416*xdata.^1.5./(xdata+74);

%% Nonlinear Least Square

theta0=[0 0]

theta_hat1=lsqcurvefit(@Viscosity,theta0,xdata,ydata)
Yhat1= Viscosity(theta_hat1,xdata)




%% Linear Least Square by Transformation

X=[xdata ones(10,1)];
Y=[xdata.^1.5./ydata];
theta_hat2=inv(X'*X)*X'*Y
C=1/theta_hat2(1)
S=[theta_hat2(2)*C]
theta2=[C S]
Yhat2= Viscosity(theta2,xdata)
varriance_e=1/(10-2)*(Y-xdata.^1.5./Yhat2)'*(Y-xdata.^1.5./Yhat2)
variance= inv(X'*X)*varriance_e



plot(xdata,y,'black')
hold on
plot(xdata,ydata,'r*')
hold on
plot(xdata,Yhat1,xdata,Yhat2)
