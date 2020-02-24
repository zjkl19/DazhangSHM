%%
%clear
%close all
tic;
SampFreq = 20;     % 采样频率

%%
%load('D:\Monitoring data\Huilv\2019\1102.mat')

% 获取通道号
b1 = indata{1};
% 获取数值
b2 = indata{2};

% 振动
acc = zeros(142525,4);
for i = 1:4
  sensor = i+270; 
  index = find(b1==sensor);
  len(i) = min(length(index),1728000);
  a = b2(index);
  acc(:,i) = a(1:142525);
  %acc(:,i) = a(1:1:len(i));
  %acc2(:,i)=acc(:,i);
  %acc2(:,i) = firhighpass(acc(:,i),[0.2 0.5],SampFreq);
end
acc2=acc;
clear a

%%
% 每5min识别一次频率，每次数据长1h
tSpan = SampFreq*60*60;   %计算时长
tInterval = SampFreq*60*30;   %每次识别间隔30min

for j = 1:4
    for i = 1:max(size(acc2))/tInterval
        startTime = (i-1)*tInterval+1;              %识别开始时间点
        endTime =min(startTime+tSpan-1,max(size(acc2)));   %识别结束时间点
        a = acc2(startTime:endTime,j);
        [p,f] = pwelch(a,10000,5000,10000,SampFreq);
        [power,index] = max(p(1.75/0.002:2.2/0.002));          %1.97Hz上下浮动10%范围
        FirstFreq(i,j) = f(index+1.75/0.002-1);
    end
end
toc;

figure(1)
boxplot(FirstFreq(:,:))




