function outputArg = SaveTemperatureMat(sampFreq,folderName,timeStr,channel)
%从数据库中提取各个通道温度数据，并在指定目录中保存为Mat
%   sampFreq：采样频率，例：sampFreq = 20;
%   folderName：文件夹名称，例：folderName='DazhangMat';
%   TimeStr：时间字符串，例：timeStr='20200528';
%   channel：通道，例：channel=["C1802190792","C1802190793","C1802190794","C1802190795"];

%保存mat所需要的参数

%例：
%folderName='DazhangMat';
%dayStr='0528';
fileName = ['temperature',timeStr,'.mat'];

%大樟   Ix-1, Iy-1, Ix-2, Iy-2
%channel=["CH32-1","CH32-2","CH32-3","CH32-4"];

timeColIndex=1;    %时间所在列索引
valueColIndex=3;   %值所在列索引

table=['D',timeStr];

%TODO:考虑各个通道应变维度会不会不一样
%ostrain= zeros(1728000,length(channel));    %原始应变数据
%strain(:,i)表示第i个通道的数据
%strain= zeros(1728000,length(channel));

%xtime{i}表示第i个应变通道对应的时程数据
%cell2mat由于不同时间字符串长度不同暂时无法使用

%运行时间参考:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*sampFreq);    %原始数据，包含日期，通道，值
       
    value=cell2mat(totalData(:,valueColIndex));    %只取“值”
    xtime{i}=totalData(:,timeColIndex);    %获取时间
    oTemperature(1:length(value),i)=value;   
    
    Temperature(1:length(value),i)=oTemperature(1:length(value),i);
    
    Temperature(find(Temperature(1:length(value),i)> 50),i)=0;
    Temperature(find(Temperature(1:length(value),i)<-50),i)=0;
    
    Temperature(:,i)=ProcessZeroData(Temperature(:,i));
end

save([folderName,'\',fileName]);
outputArg=1;
end

