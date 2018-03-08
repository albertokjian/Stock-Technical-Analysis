function [ema] = EMA (dataRange,n)

k = 2/(n+1);
sma = mean(dataRange(1:n));
ema(1) = sma*(1-k) + dataRange(n+1) * k;

for i = n+2 : length(dataRange)
    ema(i-n) = ema(i-n-1) * (1-k) + dataRange(i) * k;
end

end