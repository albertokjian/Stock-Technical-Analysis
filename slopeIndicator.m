function [slope] = slopeIndicator(dataRange,n)

slope = [];
for i = n + 1 : length(dataRange)
    m = (dataRange(i) - dataRange(i-n)) / n;
    slope = [slope ; m];
end

end