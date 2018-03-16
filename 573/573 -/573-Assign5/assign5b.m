close all
clc 
clear

load entech

%time coefficient
time = corrcoef(data);

%power coefficient
[f1 p1]=psp(data(:,1),1, [0 0.5]);
[f2 p2]=psp(data(:,2),1, [0 0.5]);
[f3 p3]=psp(data(:,3),1, [0 0.5]);
[f4 p4]=psp(data(:,4),1, [0 0.5]);
[f5 p5]=psp(data(:,5),1, [0 0.5]);
[f6 p6]=psp(data(:,6),1, [0 0.5]);
[f7 p7]=psp(data(:,7),1, [0 0.5]);
[f8 p8]=psp(data(:,8),1, [0 0.5]);
[f9 p9]=psp(data(:,9),1, [0 0.5]);
[f10 p10]=psp(data(:,10),1, [0 0.5]);
[f11 p11]=psp(data(:,11),1, [0 0.5]);
[f12 p12]=psp(data(:,12),1, [0 0.5]);

power = corrcoef([p1' p2' p3' p4' p5' p6' p7' p8' p9' p10' p11' p10']);