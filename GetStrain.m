%% 从数据库中提取1天的应变数据，并对提取的数据进行滤波
%% 提取的数据依次放在各列中
%% strain:提取后的数据

%测试1天数据的psd曲线图
clear;
clc;

tic;
SampFreq = 20;     % 采样频率

%汇绿桥   SX1,SX2,SX3,SX4,SX5
%=[275,276,277,278,279,280,281,282,283,284,285,286,287];

%大樟   SX4,SX3,SX2,SX1
%channel=[541,542,543,544];

%应变4通道大约耗时480s
%大樟   SX1,SX2,SX3,SX4
channel=[544 543 542 541];

timeColIndex=1;    %时间所在列索引
valueColIndex=3;   %值所在列索引

table='D20200319';

%TODO:考虑各个通道应变维度会不会不一样
ostrain= zeros(1728000,length(channel));    %原始应变数据
%strain(:,i)表示第i个通道的数据
strain= zeros(1728000,length(channel));

%xtime{i}表示第i个应变通道对应的时程数据
%cell2mat由于不同时间字符串长度不同暂时无法使用

%运行时间参考:
%1728000个数据firhighpass(value,[0.01 0.02],SampFreq)大约耗时40s，
%1728000个数据firhighpass(value,[0.003 0.005],SampFreq)大约耗时160s，
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,channel(i),24*3600*20);    %原始数据，包含日期，通道，值
       
    value=cell2mat(totalData(:,valueColIndex));    %只取“值”
    xtime{i}=totalData(:,timeColIndex);    %获取时间
    value=ProcessZeroData(value);
    %滤波后的数据
    %postData = firhighpass(value,[0.01 0.02],SampFreq);
    ostrain(1:length(value),i)=value;
    strain(1:length(value),i)=firhighpass(value,[0.003 0.005],SampFreq);    %滤波后的数据
end

toc;
% plot(postData)


