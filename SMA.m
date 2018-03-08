function [sma] = SMA (dataRange,n)

sma = [];
for i = n + 1 : length(dataRange)
    average = mean(dataRange(i-n:i));
    sma = [sma ; average];
end


end