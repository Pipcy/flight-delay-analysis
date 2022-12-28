%preparation
delaytable = readtable('delaycause.csv');
[r c] = size(delaytable); %101315,21



%Scrubbing, removing 2020

fid = fopen("delaycause.csv");
delaytable = readtable("delaycause.csv");
head(delaytable)
[r, c] = size(delaytable);
for k = r:-1:1
delaystruct(k) = table2struct(delaytable(k, :));
end

% remove missing values
missindex = zeros(1, r);
adding = 1;
for k = 1:r
   if ismissing(delaystruct(k).arr_flights) == 1
       missindex(adding) = k;
       adding = adding + 1;
   end
end


% remove 2020
indexes = zeros(1, r);
count = 1;
for i = 1:r
   if delaystruct(i).year == 2020
       indexes(count) = i;
       count = count + 1;
   end
end
indices= find(indexes==0);
indexes(indices) = [];
delaystruct(indexes) = [];

% group by airport
allairports = cell(1, 82456);
for i=1:numel(delaystruct)
   allairports{i} = char(delaystruct(i).airport);
end
airports = categories(categorical(allairports));

%There are 383 airports so i didn%t want to display them all

%categorize by airport size (# of flights incoming), start by getting all incoming flights per airport

count = 0;

for j = numel(airports):-1:1
    for i = 1:numel(delaystruct)
        if airports{j} == delaystruct(i).airport
            count = count + delaystruct(i).arr_flights;
        end
            sizedata(j) = struct(airport = airports{j}, flights = count);
    end
    count = 0;
end
sizedata(1:5)

plot to visualize possible categories

flightcounts = zeros(1, numel(sizedata));
for i = 1:numel(sizedata)
    flightcounts(i) = sizedata(i).flights;
end

flightcounts = sort(flightcounts);
figure(1)
bar(flightcounts)
title('Number of arriving flights per airport')



%{
separate airports into 3 categories by size
small: 1000-10,000
medium: 10,000-100,000
large: 100,000+ 
%}

count = 1;
smallcounts = zeros(1, numel(flightcounts));
medcounts = zeros(1, numel(flightcounts));
largecounts = zeros(1, numel(flightcounts));
for i = 1:numel(flightcounts)
    if flightcounts(i) <= 10000
        smallcounts(count) = flightcounts(i);
        count = count + 1;
    end
    if flightcounts(i) > 10000 && flightcounts(i) < 100000
        medcounts(count) = flightcounts(i);
        count = count + 1;
    end
    if flightcounts(i) >= 100000
        largecounts(count) = flightcounts(i);
        count = count + 1;
    end
end

s_ind = find(smallcounts == 0);
smallcounts(s_ind) = [];
m_ind = find(medcounts == 0);
medcounts(m_ind) = [];
l_ind = find(largecounts == 0);
largecounts(l_ind) = [];
