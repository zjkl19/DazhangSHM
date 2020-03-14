%% 从数据库中提取1天的时间数据
%% xtime:提取后的数据

%测试1天数据的psd曲线图
clc;

tic;
SampFreq = 20;     % 采样频率


%大樟   SX4,SX3,SX2,SX1
channel=[541,542,543,544];

valueColIndex=3;   %值所在列索引
table='D20200114';

%TODO:考虑各个通道应变维度会不会不一样
%strain(:,i)表示第i个通道的数据
strain= zeros(1728000,length(channel));

for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,channel(i),24*3600*20);    %原始数据，包含日期，通道，值
    value=cell2mat(totalData(:,valueColIndex));    %只取“值”
    %滤波后的数据
    %postData = firhighpass(value,[0.01 0.02],SampFreq);
    strain(1:length(value),i)=firhighpass(value,[0.01 0.02],SampFreq);    %滤波后的数据
end

toc;
% plot(postData)


