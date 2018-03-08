function [rowNum] = dataRange(data, date1, date2)

rowIni = find(data(:,1)==date1);
rowLast = find(data(:,1)==date2);

rowNum = (rowIni : rowLast)';

end