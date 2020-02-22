%%
% 所有数据提取程序，统一重新采样
% 转化为标准单位  米 度 应变 牛

clear
close all
SampFreq = 25;     % 重采样频率

%% 倾角数据提取
% 存于InclData中

filename = '1108.txt';
fid     = fopen(filename);
indata  = textscan(fid,'%s %s %s %s %s');   
fclose(fid);

% 获取时间，
c = cellstr(indata{2});
d = char(c);
InclTime = str2num(d(:,[1 2 4 5 7 8 10]));     % 时间，精确到0.1s  10Hz
[C,ia,ib] = unique(InclTime);
clear c d C ib InclTime

% 提取对应的倾角值 并重采样为25Hz
for i = 1:11
    l = [1 1 1 1 0 1 1 0 1 0 0];   % 各倾角正负值，正为0 负为1
    a = char(indata{i+2});      % cell转化为字符
    b = str2num(a(ia,end-5-l(i):end));      % 字符转化为数字,负值需要多包括一个负号
    c = resample(b,SampFreq,10,0);       % 改变Filter阶数，获得更好的效果
    InclData(:,i) = c;
end
clear a b c d l ia


%% 光纤光栅数据提取程序

% 参数设置
dir     = 'D:\FangCloudSync\My expriment\Test Data\20170831\原始数据';
file    = 'CH_1_20170831_142028';                          % 任意输入一个文件名
date    = file(end-15:end);                      %  提取文件名中的日期

% 应变提取 CH1~CH11
% StrData
for i = 1:11
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f %f %f %f %f ');   
    fclose(fid);
    a = cell2mat(indata([4 6 8]));       % 应变值所在列
    StrData(:,(i-1)*3+1:i*3) = resample(a,SampFreq*2,12.5*2);
end
StrData = StrData*1e-6;         % 微应变转化为应变

% 位移提取 CH13~CH15，第二根光纤为位移值
% DispData
for i = 13:14
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f');   
    fclose(fid);    
    a = cell2mat(indata([6]));
    DispData(:,i-12) = -resample(a,SampFreq*2,12.5*2);
end

% 大气温度计 CH12 CH16
% TempData
for i = 12
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f');   
    fclose(fid);    
    a = cell2mat(indata([4]));
    TempData(:,1) = resample(a,SampFreq*2,12.5*2);
end

for i = 16
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f');   
    fclose(fid);    
    a = cell2mat(indata([4]));
    TempData(:,2) = resample(a,SampFreq*2,12.5*2);
end    

% 结构温度 CH17
% TempData
for i = 17
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f');   
    fclose(fid);    
    tData = cell2mat(indata([4 6 8 10 12 14 16]));       % 结构温度计位于17通道，时间与前16个不不同步，造成行数有略微区别
    tData = resample(tData,SampFreq*2,12.5*2);
end    
TempData(:,3:9) = tData(1:size(StrData,1),:);
clear tData

%% 东华数据提取
load 'D:\FangCloudSync\My expriment\Test Data\20170831\原始数据\20170831.mat';

% 支座反力，滤波为25Hz
% RfData
Datas = Datas(:,12:19);
for i = 1:8
    RfData(:,i) = resample(Datas(:,i),SampFreq,200);
end
clear Datas


%% 保存数据
save AllData InclData DispData StrData TempData RfData



