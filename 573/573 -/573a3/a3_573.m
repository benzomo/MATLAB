%Question1
r=randn(1,100000)';

y2=filter(1, [1 -1 .5],r);
pacf(y2,25,1);

y3=filter(1, [1 -1 .25],r);
pacf(y3,25,1);

%Question2
pacf(data4q2(:,1),30,1);
pacf(data4q2(:,2),30,1);
pacf(data4q2(:,3),30,1);

%Question3
y =filter([0 0 0 5], [1 -.8],r);
z = iddata(y,r);
zd = detrend(z);
cra(zd,30);

%Question4
z = iddata(STHID(:,1), STHID(:,2));
zd = detrend(z);
y = cra(zd,250);
cra(zd,250)
yd = cumsum(y);
step(zd,50);