
%%
%测试1天数据的psd曲线图
clear;
clc;

tic;
SampFreq = 20;     % 采样频率

%汇绿桥   SX1,SX2,SX3,SX4,SX5
%=[275,276,277,278,279,280,281,282,283,284,285,286,287];

%大樟   SX4,SX3,SX2,SX1
channel=[541,542,543,544];


%汇绿桥
% | 275 | 应变SX1      | 主跨1/4（北）西侧           |
% | 276 | 应变SX2      | 主跨1/4（北）跨中心         |
% | 277 | 应变SX3      | 主跨1/4（北）东侧           |
% | 278 | 应变SX4      | 跨中西侧                    |
% | 279 | 应变SX5      | 主跨跨中                    |
% | 280 | 应变SX6      | 跨中东侧                    |
% | 281 | 应变SX7      | 主跨3/4（南）西侧           |
% | 282 | 应变SX8      | 主跨3/4（南）跨中心         |
% | 283 | 应变SX9      | 主跨3/4（南）东侧           |
% | 284 | 应变SX10     | 拱顶（上游）                |
% | 285 | 应变SX11     | 拱顶                        |
% | 286 | 应变SX12     | 拱顶                        |
% | 287 | 应变SX13     | 拱顶（下游）                |

valueColIndex=3;   %值所在列索引
table='D20200114';

%TODO:考虑各个通道应变维度会不会不一样
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


