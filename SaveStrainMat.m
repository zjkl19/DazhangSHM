function outputArg = SaveStrainMat(sampFreq,folderName,timeStr,channel)
%从数据库中提取各个通道应变数据，并在指定目录中保存为Mat
%   sampFreq：采样频率，例：sampFreq = 20;
%   folderName：文件夹名称，例：folderName='DazhangMat';
%   TimeStr：时间字符串，例：timeStr='20200528';
%   channel：通道，例：channel=["C1802190792","C1802190793","C1802190794","C1802190795"];

%保存mat所需要的参数

%例：
%folderName='DazhangMat';
%dayStr='0528';
fileName = ['strain',timeStr,'.mat'];

%大樟   SX1,SX2,SX3,SX4
%channel=["C1802190792","C1802190793","C1802190794","C1802190795"];

timeColIndex=1;    %时间所在列索引
valueColIndex=3;   %值所在列索引

table=['D',timeStr];

for i = 1:l360ength(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*sampFreq);    %原始数据，包含日期，通道，值
       
    value=cell2mat(totalData(:,valueColIndex));    %只取“值”
    xtime{i}=totalData(:,timeColIndex);    %获取时间
    value=ProcessZeroData(value);
    %滤波后的数据
    %postData = firhighpass(value,[0.01 0.02],SampFreq);
    ostrain(1:length(value),i)=value;
    strain(1:length(value),i)=firhighpass(value,[0.003 0.005],sampFreq);    %滤波后的数据
end

save([folderName,'\',fileName]);
outputArg=1;
end

