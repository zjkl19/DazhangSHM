%% 从数据库中提取1天的倾角数据
%% 提取的数据依次放在各列中
%% lean:提取后的数据

clc;

tic;
SampFreq = 20;     % 采样频率

%保存mat所需要的参数
folderName='DazhangMat';
dayStr='0528';
fileName = ['lean',dayStr,'.mat'];

%大樟   Ix-1, Iy-1, Ix-2, Iy-2
channel=["CH32-1","CH32-2","CH32-3","CH32-4"];

timeColIndex=1;    %时间所在列索引
valueColIndex=3;   %值所在列索引

table=['D2020',dayStr];

%TODO:考虑各个通道应变维度会不会不一样

%lean(:,i)表示第i个通道的数据
%olean= zeros(SampFreq*60*60*24,length(channel));
%lean= zeros(SampFreq*60*60*24,length(channel));
%xtime{i}表示第i个通道对应的时程数据
%cell2mat由于不同时间字符串长度不同暂时无法使用

%运行时间参考:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*SampFreq);    %原始数据，包含日期，通道，值
       
    value=cell2mat(totalData(:,valueColIndex));    %只取“值”
    xtime{i}=totalData(:,timeColIndex);    %获取时间
    olean(1:length(value),i)=value;
    
    lean(1:length(value),i)=olean(1:length(value),i);
    lean(:,i)=ProcessZeroData(lean(:,i));
    %lean(find(lean(1:length(value),i)> 3),i)=0;
    %lean(find(lean(1:length(value),i)<-3),i)=0;
   
    lean(:,i)=lean(:,i)-mean(lean(:,i));
    
end

save([folderName,'\',fileName]);

toc;


