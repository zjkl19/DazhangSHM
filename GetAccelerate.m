%% 从数据库中提取1天的加速度数据
%% 提取的数据依次放在各列中
%% acc:提取后的数据

clc;

tic;
SampFreq = 20;     % 采样频率

%保存mat所需要的参数
folderName='DazhangMat';
dayStr='0705';
fileName = ['accelerate',dayStr,'.mat'];

%大樟   Az-1, Az-2, Az-3
channel=["CH19-1","CH210-1","CH311-1"];

timeColIndex=1;    %时间所在列索引
valueColIndex=3;   %值所在列索引

table=['D2020',dayStr];

%TODO:考虑各个通道应变维度会不会不一样

%acc(:,i)表示第i个通道的数据
%acc= zeros(1728000,length(channel));

%xtime{i}表示第i个通道对应的时程数据
%cell2mat由于不同时间字符串长度不同暂时无法使用

%运行时间参考:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*20);    %原始数据，包含日期，通道，值
       
    value=cell2mat(totalData(:,valueColIndex));    %只取“值”
    %xtime{i}=totalData(:,timeColIndex);    %获取时间
    value=ProcessZeroData(value);
    acc(1:length(value),i)=value;
end

save([folderName,'\',fileName]);

toc;


