%Question 1
r=randn(1,100000);
y=filter([1 .8 .4],1,r);

[ACF1 , Lags1 , bounds1] = autocorr(y);
figure
autocorr(y)

%Question 2
rho2(1) = 1;
rho2(2) = 2/3;

for i=3:1:10
    rho2(i) = rho2(i-1)-.5*rho2(i-2);
end
 
y2=filter(1, [1 -1 .5],r);

[ACF2 , Lags2 , bounds2] = autocorr(y2);
figure
autocorr(y2,25,0,2)

%Question 3
rho3(1) = 1/1.25;
rho3(2) = .55;

for i=3:1:10
    rho3(i) = rho3(i-1)-.25*rho3(i-2);
end

y3=filter(1, [1 -1 .25],r);

[ACF3 , Lags3 , bounds3] = autocorr(y3);
figure
autocorr(y3,25,0,2)