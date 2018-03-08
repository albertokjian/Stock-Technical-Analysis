function [] = stockPlot(acrynym,date1,date2)
% function that takes in an acrynym, two dates, and performs data analysis
name = stockName(acrynym);
data = csvread(name);
[rowNum] = dataRange(data, date1, date2);

closeNum = data(rowNum,6);
volume = data(rowNum,7);


figure(1);
% 15 day and 30 day simple moving average 
subplot(7,1,[1 4]);
plot(1:numel(rowNum),closeNum,'-r');
hold on
n = 15;
[sma] = SMA (closeNum,n);
plot(n+1:numel(rowNum),sma,'-c');
n = 30;
[sma] = SMA (closeNum,n);
plot(n+1:numel(rowNum),sma,'-b');

xlabel(['business days since ',num2str(date1)]);
ylabel('stock price');
title([acrynym,' stock analysis using 6 week periods']);
legend('stock price','15 day sma','30 day sma');

% subplot asked by David to include volume
subplot(7,1,[6 7]);
bar(1:numel(rowNum),volume,'EdgeColor','g','FaceColor','g');
xlim([0,numel(rowNum)]);

figure(2)
% 15 day and 30 day exponential moving average
subplot(7,1,[1 4]);
plot(1:numel(rowNum),closeNum,'-r');
hold on
n = 15;
[ema] = EMA (closeNum, n);
plot(n+1:numel(rowNum),ema,'-y');
n = 30;
[ema] = EMA (closeNum, n);
plot(n+1:numel(rowNum),ema,'-g');

xlim([0,numel(rowNum)]);
xlabel(['business days since ',num2str(date1)]);
ylabel('stock price');
title([acrynym,' stock analysis using 3 week periods']);
legend('stock price','15 day ema','30 day ema');

% subplot asked by David to include volume
subplot(7,1,[6 7]);
bar(1:numel(rowNum),volume,'EdgeColor','g','FaceColor','g');
xlim([0,numel(rowNum)]);


figure(3);
% 30 day linear regression
subplot(7,1,[1 4]);
plot(1:numel(rowNum),closeNum,'-r');
hold on
n = 30;
plotLinearReg(closeNum,n);
xlabel(['business days since ',num2str(date1)]);
ylabel('stock price');
title([acrynym,' stock analysis using 6 week periods']);
legend('stock price','linear regression');
xlim([0,numel(rowNum)]);

% subplot asked by David to include volume
subplot(7,1,[6 7]);
bar(1:numel(rowNum),volume,'EdgeColor','g','FaceColor','g');
xlim([0,numel(rowNum)]);



figure(4);
% 15 day linear regression
subplot(7,1,[1 4]);
plot(1:numel(rowNum),closeNum,'-r');
hold on
n = 15;
plotLinearReg(closeNum,n);
xlabel(['business days since ',num2str(date1)]);
ylabel('stock price');
title([acrynym,' stock analysis using 3 week periods']);
legend('stock price','linear regression');
xlim([0,numel(rowNum)]);

% subplot asked by David to include volume
subplot(7,1,[6 7]);
bar(1:numel(rowNum),volume,'EdgeColor','g','FaceColor','g');
xlim([0,numel(rowNum)]);



figure(5)
% 30 day and 15 day slope indicator. change of stock price over day.
n = 30;
slope = slopeIndicator(closeNum,n);
plot(n+1:numel(rowNum),slope,'-y');
hold on
n = 15;
slope = slopeIndicator(closeNum,n);
plot(n+1:numel(rowNum),slope,'-g');
xlabel(['business days since ',num2str(date1)]);
ylabel('stock price');
title([acrynym,' stock analysis using slope indicator']);
legend('30 day slope indicator','15 day slope indicator');
xlim([0,numel(rowNum)]);
end