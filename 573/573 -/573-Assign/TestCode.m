%matrix of flow rates 

FlowRates(:,1) = 1.256 +178.032*sqrt(Data_3(:,2)); %Cold Water
FlowRates(:,2) = 1.444+181.574*sqrt(Data_3(:,3)); %Hot Water
FlowRates(:,3) = -2.319 + 355.822*sqrt(Data_3(:,4)); %Total Water

%plot raw data
figure
plot([FlowRates(:,1) FlowRates(:,2) FlowRates(:,3)])
title('Raw Flow Rates')
ylabel('Mass Flow(kg/h)')
set(legend('FlowCold','FlowHot','FlowTot'),'Location','SouthEast');

%step at 1708, separate data

aFlowRates = FlowRates(1:1500, :); %reduce data to 1500
bFlowRates = FlowRates(1800:2800, :); %reduce data to 1000

%Results (mean, Variance)

FlowMean(1,:) = mean(aFlowRates); %flow mean part a
FlowMean(2,:) = var(aFlowRates); %flow variance part a
FlowMean(3,:) = mean(bFlowRates); %flow mean part b
FlowMean(4,:) = var(bFlowRates); %flow variance part b

%find and replace outliers

for i= 1:1:3

FlowOutliers = find(aFlowRates(:,i)<FlowMean(1,i)-3*sqrt(FlowMean(2,i)) | aFlowRates(:,i)>FlowMean(1,i)+3*sqrt(FlowMean(2,i)));
aFlowRates(FlowOutliers,i) = FlowMean(1,i);

end

for i= 1:1:3

FlowOutliers = find(bFlowRates(:,i)<FlowMean(3,i)-3*sqrt(FlowMean(4,i)) | bFlowRates(:,i)>FlowMean(3,i)+3*sqrt(FlowMean(4,i)));
bFlowRates(FlowOutliers,i) = FlowMean(3,i);

end

%Results without Outlier (mean, Variance)

NewFlowMean(1,:) = mean(aFlowRates); %flow mean part a
NewFlowMean(2,:) = var(aFlowRates); %flow variance part a
NewFlowMean(3,:) = mean(bFlowRates); %flow mean part b
NewFlowMean(4,:) = var(bFlowRates); %flow variance part b

%plot flow without outlier
figure
subplot(1, 2, 1)
plot(aFlowRates)
title('Clean Flow Rates for Section A')
ylabel('Mass Flow(kg/h)')
set(legend('FlowCold','FlowHot','FlowTot'),'Location','East');
subplot(1, 2, 2)
plot(bFlowRates)
title('Clean Flow Rates for Section B')
ylabel('Mass Flow(kg/h)')
set(legend('FlowCold','FlowHot','FlowTot'),'Location','East');

%mass balance
aMassBalance(:,1) = aFlowRates(:,1) + aFlowRates(:,2);
aMassBalance(:,2) = aFlowRates(:,3);
aMassBalance(:,3) = aMassBalance(:,1) - aMassBalance(:,2);

bMassBalance(:,1) = bFlowRates(:,1) + bFlowRates(:,2);
bMassBalance(:,2) = bFlowRates(:,3);
bMassBalance(:,3) = bMassBalance(:,1) - bMassBalance(:,2);

%data plot
figure
subplot(1, 2, 1)
plot(aMassBalance(:,1:2))
title('Clean Flow Rates for Section A')
ylabel('Mass Flow(kg/h)')
set(legend('Theoretical Flow','FlowTot'),'Location','SouthEast');
subplot(1, 2, 2)
plot(bMassBalance(:,1:2))
title('Clean Flow Rates for Section B')
ylabel('Mass Flow(kg/h)')
set(legend('Theoretical Flow','FlowTot'),'Location','SouthEast');

%histogram plot
figure
subplot(1, 2, 1)
hist(aMassBalance(:,3))
title('Frequency of Error for Section A Mass Balance')
subplot(1, 2, 2)
hist(bMassBalance(:,3))
title('Frequency of Error for Section B Mass Balance')

%error in Section A (1 = section A; 2 = section B)
ErrorMass(1)=mean(aMassBalance(:,3));
ErrorMass(2)=mean(bMassBalance(:,3));

%Temperatures

Temp = Data_3(:,5:1:8);

%plot raw data
figure
plot(Temp)
ylabel('Temp(\circC)')
set(legend('T1','T2','T4','T5'),'Location','SouthEast');

%same data range as flow
aTempEnd = 777;

aTemp = Temp(1:aTempEnd, :);
bTemp = Temp(1800:2800, :);

%plot temperature data
figure
subplot(1, 2, 1)
plot(aTemp)
title('Raw Temperature for Section A')
ylabel('Temp(\circC)')
set(legend('T1','T2','T4','T5'),'Location','SouthEast');
subplot(1, 2, 2)
plot(bTemp)
title('Raw Temperature for Section B')
ylabel('Temp(\circC)')
set(legend('T1','T2','T4','T5'),'Location','SouthEast');


%Results (mean, Variance)

TempMean(1,:) = mean(aTemp); %flow mean part a
TempMean(2,:) = var(aTemp); %flow variance part a
TempMean(3,:) = mean(bTemp); %flow mean part b
TempMean(4,:) = var(bTemp); %flow variance part b

%find and replace outliers

for i= 1:1:4

TempOutliers = find(aTemp(:,i)<TempMean(1,i)-3*sqrt(TempMean(2,i)) | aTemp(:,i)>TempMean(1,i)+3*sqrt(TempMean(2,i)));
aTemp(TempOutliers,i) = TempMean(1,i);

end

for i= 1:1:4

TempOutliers = find(bTemp(:,i)<TempMean(3,i)-3*sqrt(TempMean(4,i)) | bTemp(:,i)>TempMean(3,i)+3*sqrt(TempMean(4,i)));
bTemp(TempOutliers,i) = TempMean(3,i);

end

%plot temperature data
figure
subplot(1, 2, 1)
plot(aTemp)
title('Clean Temperature Data for Section A')
ylabel('Temp(\circC)')
set(legend('T1','T2','T4','T5'),'Location','SouthEast');
subplot(1, 2, 2)
plot(bTemp)
title('Clean Temperature Data for Section B')
ylabel('Temp(\circC)')
set(legend('T1','T2','T4','T5'),'Location','SouthEast');

%Results without Outlier (mean, Variance)

NewTempMean(1,:) = mean(aTemp); %flow mean part a
NewTempMean(2,:) = var(aTemp); %flow variance part a
NewTempMean(3,:) = mean(bTemp); %flow mean part b
NewTempMean(4,:) = var(bTemp); %flow variance part b

%Temperature sensor vs theory (col 1 = theory temp; col 2 = T4; col 4 = T5)

aEnergyBalance(:,1) = (aFlowRates(1:aTempEnd, 1).*aTemp(:,1) + aFlowRates(1:aTempEnd, 2).*aTemp(:,2))./(aFlowRates(1:aTempEnd, 1) + aFlowRates(1:aTempEnd, 2));
aEnergyBalance(:,2) = aTemp(:,3);
aEnergyBalance(:,4) = aTemp(:,4);

bEnergyBalance(:,1) = (bFlowRates(:, 1).*bTemp(:,1) + bFlowRates(:, 2).*bTemp(:,2))./bFlowRates(:, 3);
bEnergyBalance(:,2) = bTemp(:,3);
bEnergyBalance(:,4) = bTemp(:,4);

%plot temperature data
figure
subplot(1, 2, 1)
plot([aEnergyBalance(:,2) aEnergyBalance(:,4) aEnergyBalance(:,1)])
title('Clean Temperature for Section A Mixed Section')
ylabel('Temp(\circC)')
set(legend('T4','T5','Theoretical Temp'),'Location','SouthEast');

subplot(1, 2, 2)
plot([bEnergyBalance(:,2) bEnergyBalance(:,4) bEnergyBalance(:,1)])
title('Clean Temperature for Section B Mixed Section')
ylabel('Temp(\circC)')
set(legend('T4','T5','Theoretical Temp'),'Location','SouthEast');

%deviation from theory
for i = 1:1:1500
aEnergyBalance(:,3) = aEnergyBalance(:,1) - aEnergyBalance(:,2);
aEnergyBalance(:,5) = aEnergyBalance(:,1) - aEnergyBalance(:,4);
end

for i = 1:1:1001
bEnergyBalance(:,3) = bEnergyBalance(:,1) - bEnergyBalance(:,2);
bEnergyBalance(:,5) = bEnergyBalance(:,1) - bEnergyBalance(:,4);
end

%stat of temperatures (row 1 mean, row 2 var; col 1 = part a, col2 = part b
EnergyBalanceMean(1,:) = [mean(aEnergyBalance(:,3)) mean(aEnergyBalance(:,5))  mean(bEnergyBalance(:,3)) mean(bEnergyBalance(:,5))];
EnergyBalanceMean(2,:) = [var(aEnergyBalance(:,3)) var(aEnergyBalance(:,5))  var(bEnergyBalance(:,3)) var(bEnergyBalance(:,5))];

%error for each section
figure
subplot(1, 2, 1)
hist(aEnergyBalance(:,3))
title('Frequency of Error for Section A Sensor T4')
ylabel('Temp(\circC)')
subplot(1, 2, 2)
hist(bEnergyBalance(:,3))
title('Frequency of Error for Section B Sensor T4')
ylabel('Temp(\circC)')

figure
subplot(1, 2, 1)
hist(aEnergyBalance(:,5))
title('Frequency of Error for Section A Sensor T5')
ylabel('Temp(\circC)')
subplot(1, 2, 2)
hist(bEnergyBalance(:,5))
title('Frequency of Error for Section B Sensor T5')
ylabel('Temp(\circC)')

ErrorEnergyBalance(1,:) = [mean(aEnergyBalance(:,3)) mean(bEnergyBalance(:,3))];
ErrorEnergyBalance(2,:) = [mean(aEnergyBalance(:,5)) mean(bEnergyBalance(:,5))];