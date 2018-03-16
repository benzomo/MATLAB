simh1=Height.signals.values(:,1);
simh2=Height.signals.values(:,2);

simT1=Temp.signals.values(:,1);
simT2=Temp.signals.values(:,2);
simT3=Temp.signals.values(:,3);


t=1:1:length(simT1);

subplot(2,2,[1 3])
plot(t, simh1, t, simh2)
legend('Tank 1','Tank 2','location','NorthWest')
title('Tank Heights (m)')
subplot(2,2,2)
plot(t, simT1, t, simT2)
legend('Tank 1','Tank 2','location','NorthWest')
title('Tank Temperatures(C)')
subplot(2,2,4)
plot(t, simT3)
legend('Tank 3','location','NorthWest')
title('Tank Temperatures(C)')
