%more detail: https://www.kaggle.com/datasets/jawadkhattak/us-flight-delay-from-january-2017-july-2022
%preparation
delaytable = readtable('delayDataSet.csv');
[r c] = size(delaytable); %101315,21


table2021 = delaytable(delaytable.year == 2021, :);%2021 data
table_8_12 = table2021(table2021.month > 7, :);%2021 data
table2021_bos = table_8_12(table_8_12.airport == "BOS", :);

table2022 = delaytable(delaytable.year == 2022, :);%2022 data
table2022_bos = table2022(table2022.airport == "BOS", :); %bos logan 2022 data
table2022_bos = [table2021_bos; table2022_bos];

array_all = zeros(12,14);
data22_bos_9E = table2022_bos(table2022_bos.carrier == "9E", :); %Endeavor Air from jan to jul 2022
data22_bos_AA = table2022_bos(table2022_bos.carrier == "AA", :); %American Airline from jan to jul 2022
data22_bos_AS = table2022_bos(table2022_bos.carrier == "AS", :);
data22_bos_B6 = table2022_bos(table2022_bos.carrier == "B6", :);
data22_bos_DL = table2022_bos(table2022_bos.carrier == "DL", :);
data22_bos_F9 = table2022_bos(table2022_bos.carrier == "F9", :);
data22_bos_G4 = table2022_bos(table2022_bos.carrier == "G4", :);
data22_bos_HA = table2022_bos(table2022_bos.carrier == "HA", :);
data22_bos_MQ = table2022_bos(table2022_bos.carrier == "MQ", :);
data22_bos_NK = table2022_bos(table2022_bos.carrier == "NK", :);
data22_bos_UA = table2022_bos(table2022_bos.carrier == "UA", :);
data22_bos_WN = table2022_bos(table2022_bos.carrier == "WN", :);
data22_bos_YX = table2022_bos(table2022_bos.carrier == "YX", :);

for i = 1:12
    array_all(i,1) = i;
%average delay min per flight
    array_all(i,2) = data22_bos_9E{i,16} / data22_bos_9E{i,7};             
    array_all(i,3) = data22_bos_AA{i,16} / data22_bos_AA{i,7}; 
    array_all(i,4) = data22_bos_AS{i,16} / data22_bos_AS{i,7}; 
    array_all(i,5) = data22_bos_B6{i,16} / data22_bos_B6{i,7}; 
    array_all(i,6) = data22_bos_DL{i,16} / data22_bos_DL{i,7}; 
    array_all(i,7) = data22_bos_F9{i,16} / data22_bos_F9{i,7}; 
    array_all(i,8) = data22_bos_G4{i,16} / data22_bos_G4{i,7}; 
    array_all(i,9) = data22_bos_HA{i,16} / data22_bos_HA{i,7}; 
    array_all(i,10) = data22_bos_MQ{i,16} / data22_bos_MQ{i,7}; 
    array_all(i,11) = data22_bos_NK{i,16} / data22_bos_NK{i,7}; 
    array_all(i,12) = data22_bos_UA{i,16} / data22_bos_UA{i,7}; 
    array_all(i,13) = data22_bos_WN{i,16} / data22_bos_WN{i,7}; 
    array_all(i,14) = data22_bos_YX{i,16} / data22_bos_YX{i,7}; 
   
end
array_all;
month = array_all(:,1)';
y9E = array_all(:,2)';
yAA = array_all(:,3)';
yAS = array_all(:,4)';
yB6 = array_all(:,5)';
yDL = array_all(:,6)';
yF9 = array_all(:,7)';
yG4 = array_all(:,8)';
yHA = array_all(:,9)';
yMQ = array_all(:,10)';
yNK = array_all(:,11)';
yUA = array_all(:,12)';
yWN = array_all(:,13)';
yYX = array_all(:,14)';
%table view
tbl = array2table(array_all,'VariableNames',{'month','9E','AA','AS','B6','DL','F9','G4','HA','MQ','NK','UA','WN','YX'})


figure(1)
plot(tbl,["9E" "AA" "AS" "B6" "DL" "F9" "G4" "HA" "MQ" "NK" "UA" "WN" "YX"]);
legend
title("Average Delay Time Per Flight (in minutes) for All Airline Carriers at BOS Logan in 12 months");
axis([1 12 0 45])


figure(3)
x_B6 = 1:12;
y_B6 = tbl.B6;
plot(x_B6,y_B6);
axis([1 12 0 45]);
