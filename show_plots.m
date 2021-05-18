clc
clear
close all
y=xlsread('result.xlsx');
[p,q]=sort(y(:,1));
yy=y(q,:);
hh=[];
for i=1:7:length(y)
    uu=yy(i:i+6,:);
    [p,q]=sort(uu(:,2));
    hh=[hh;uu(q,:)];
end

time=[];
for i=1:7:length(hh)
    time=[time;hh(i:i+6,3)'];
end
bar(time)
xlabel('N','fontsize',12)
ylabel('Elapsed Utilization Time (ms)')
title('K=1, K=5, K=10, K=20, K=30, K=40, K=62')
set(gca,'xticklabel',{'1' '5' '10' '18' '33'},'ygrid','on')

figure()
CARRY=[];
for i=1:7:length(hh)
    CARRY=[CARRY;hh(i:i+6,4)'];
end
bar(CARRY)
xlabel('N','fontsize',12)
ylabel('CARRY Cell (Number)')
title('K=1, K=5, K=10, K=20, K=30, K=40, K=62')
set(gca,'xticklabel',{'1' '5' '10' '18' '33'},'ygrid','on')

figure()
LUT=[];
for i=1:7:length(hh)
    LUT=[LUT;hh(i:i+6,5)'];
end
bar(LUT)
xlabel('N','fontsize',12)
ylabel('LUT Cell (Number)')
title('K=1, K=5, K=10, K=20, K=30, K=40, K=62')
set(gca,'xticklabel',{'1' '5' '10' '18' '33'},'ygrid','on')

figure()
IBUF=[];
for i=1:7:length(hh)
    IBUF=[IBUF;hh(i:i+6,6)'];
end
bar(IBUF)
xlabel('N','fontsize',12)
ylabel('IBUF Cell (Number)')
title('K=1, K=5, K=10, K=20, K=30, K=40, K=62')
set(gca,'xticklabel',{'1' '5' '10' '18' '33'},'ygrid','on')

figure()
OBUF=[];
for i=1:7:length(hh)
    OBUF=[OBUF;hh(i:i+6,7)'];
end
bar(OBUF)
xlabel('N','fontsize',12)
ylabel('OBUF Cell (Number)')
title('K=1, K=5, K=10, K=20, K=30, K=40, K=62')
set(gca,'xticklabel',{'1' '5' '10' '18' '33'},'ygrid','on')

figure()
TOTAL=[];
for i=1:7:length(hh)
    TOTAL=[TOTAL;hh(i:i+6,8)'];
end
bar(TOTAL)
xlabel('N','fontsize',12)
ylabel('Total Cell Number')
title('K=1, K=5, K=10, K=20, K=30, K=40, K=62')
set(gca,'xticklabel',{'1' '5' '10' '18' '33'},'ygrid','on')

NN=[1 5 10 18 33];
KK=[1 5 10 20 30 40 62];

time_z=[];
LUT_z=[];
[xx,yy]=meshgrid(NN,KK);
for i=1:7:length(y)
    time_z=[time_z hh(i:i+6,3)];
    LUT_z=[LUT_z hh(i:i+6,5)];
end
figure()
surf(xx,yy,LUT_z)
xlabel('N')
ylabel('K')
zlabel('LUT Cell (Number)')

figure()
time_18=hh(22:22+6,3);
plot([1 5 10 20 30 40 62],time_18,'o-')
grid on
xlabel('K')
ylabel('Elapsed Utilization Time (ms)')
title('N=18')
