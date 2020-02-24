
%%
%测试1天数据的psd曲线图
clear;
clc;

tic;
SampFreq = 20;     % 采样频率
channel=279;
ValueColIndex=3;   %值所在列索引
table='D1115';

%原始数据，包含日期，通道，值
totalData=GetDataFromSqlServer(table,channel,24*3600*20);

%只取“值”
value=cell2mat(totalData(:,ValueColIndex));

%滤波后的数据
postData = firhighpass(value,[0.01 0.02],SampFreq);
toc;
plot(postData)


