function [] = plotLinearReg(dataRange,n)

intervals = floor(length(dataRange)/n);
xRange = 1:n;
yhat = [];
for i = 1:intervals
    xData = (xRange+(i-1)*n)';
    yData = dataRange(xData);
    p = polyfit(xData,yData,1);
    yhat = p(1) * xData + p(2);
    plot(xData,yhat,'-b','linewidth',1);
end

end

