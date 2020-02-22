%%
clear
close all
SampFreq = 20;     % 重采样频率

%%
filename = 'D:\Monitoring data\Huilv\2019\1101.txt';
fid     = fopen(filename);
% 读取文本，*表示跳过文本
indata  = textscan(fid,'%*s %*s %d %*d %f');   
fclose(fid);


%%
% 获取通道号
b1 = indata{1};
% 获取数值
b2 = indata{2};

% 指定分析通道号
sensor = 275;
index = find(b1==sensor);
data = b2(index);

