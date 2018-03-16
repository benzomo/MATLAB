close all
clc
clear

load Pump_data.txt

%1a)
figure
plot(Pump_data)
xlabel('Time, t');
legend('Flow (gal/min)', 'Head Press (psi)','location','Best');
title('Head Pressure and Flow Rate as a Function of Time')

%1b)
flow=Pump_data(:,1); %gal/min
head=Pump_data(:,2); %psi

figure
plot(flow, head, 'o')
xlabel('Flow (gal/min)');
ylabel('Head Press (psi)');
title('Head Pressure as a Function of Flow Rate');

%1c)
P=polyfit(flow(1:1000), head(1:1000),2);
predhead=P(1).*flow.^2+P(2).*flow.^1+P(3);

%1d)
figure
plot(flow(1:1000), head(1:1000), 'ob')
hold on;
plot(flow(1:1000), predhead(1:1000), '*r')
xlabel('Flow (gal/min)');
ylabel('Head Press (psi)');
title('Head Pressure as a Function of Flow Rate');

%1e)    fault at 1400
error=head-predhead;
figure
plot(error,'o')
xlabel('Time, t');
ylabel('Head Pressure Fault (psi)');
title('Head Pressure Fault as a Function of Time');

%1f) yes
figure
plot(head)
xlabel('Time, t');
ylabel('Head Press (psi)');
title('Head Pressure Fault Oberservation');

%1g) 
meanerror=mean(error(1:1000));
varerror=var(error(1:1000));

outlierhigh=meanerror+2*sqrt(varerror);
outlierlow=meanerror-2*sqrt(varerror);

error=head-predhead;
figure
plot(error,'o')
hold on
plot([1,1831], [outlierhigh, outlierhigh], 'k')
plot([1,1831], [outlierlow, outlierlow], 'k')
xlabel('Time, t');
ylabel('Head Pressure Fault (psi)');
title('Head Pressure Fault as a Function of Time');

falseAlarm=length(find(error(1:1400)<=outlierlow | error(1:1400) >= outlierhigh))
missingAlarm=length(find(error(1401:end)>=outlierlow & error(1401:end) <= outlierhigh))

%1h) 
maerrortemp = filter([.2 .2 .2 .2 .2],1,error);
maerror = maerrortemp(5:end);

figure
plot(maerror, 'x')

%1i)
n=-4:.6:16;
figure
subplot(2,1,1)
hist(error,n)
subplot(2,1,2)
hist(maerror,n)

%1j) 
outliermahigh = 2;
mafalseAlarm=length(find(maerror(1:1400-5) >= outliermahigh))
mamissingAlarm=length(find(maerror(1401-5:end) <= outliermahigh))
