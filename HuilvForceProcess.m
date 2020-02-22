%%
clear
close all
SampFreq = 20;     % 采样频率

%%
load('D:\Monitoring data\Huilv\2019\1102.mat')

% 获取通道号
b1 = indata{1};
% 获取数值
b2 = indata{2};

% 振动
acc = zeros(1729000,4);
for i = 1:4
  sensor = i+287; 
  index = find(b1==sensor);
  len(i) = length(index);
  a = b2(index);
  a(a==0) = mean(a);
  acc(1:len(i),i) = a;
  acc2(:,i) = firhighpass(acc(:,i),[0.5 1],SampFreq);
end
clear a

%%
% 每5min识别一次频率，每次数据长10min
tSpan = SampFreq*60*10;   %计算时长
tInterval = SampFreq*60*10;   %每次识别间隔10min

for j = 1:4
    for i = 1:max(size(acc2))/tInterval
        startTime = (i-1)*tInterval+1;              %识别开始时间点
        endTime =min(startTime+tSpan-1,max(size(acc2)));   %识别结束时间点
        a = acc2(startTime:endTime,j);
        [p,f] = pwelch(a,2000,1000,2000,SampFreq);
        [power,index] = max(p(4.3/0.01:5.6/0.01));          %空载（4.9Hz）下浮10%（4.41）,满载（5.3）上浮0%（5.53）
        FirstFreq(i,j) = f(index+4.3/0.01-1);
    end
end

Force = 4*8000*3245.5*1e-6*20.644^2*FirstFreq.^2/1000;

boxplot(FirstFreq)





