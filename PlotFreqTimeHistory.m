
%%
%测试1天数据的psd曲线图

SampFreq = 20;     % 采样频率
div=50;
L=length(acc);    %数据长度
nfft=2^nextpow2(L/div);
window=hamming(nfft/div);    %分10段
noverlap=length(window)/2;   %分段重叠长度
pwelch(acc(1:fix(L/div)) ,window,noverlap,nfft,SampFreq);

%%
% 每5min识别一次频率，每次数据长1h

% fLbound=3.87*0.9;fUbound=3.87*1.1;
% 
% tSpan = SampFreq*60*60;   %计算时长
% tInterval = SampFreq*60*30;   %每次识别间隔30min（单位：s）
% 
% for i = 1:length(data)/tInterval
%     startTime = (i-1)*tInterval+1;              %识别开始结点
%     endTime =min(startTime+tSpan-1,L);   %识别结束结点
%     
%     dataToAnalyze = data(startTime:endTime,1);
%     L=length(dataToAnalyze);
%     nfft=2^nextpow2(L);
%     window=hamming(nfft/10);    %分10段
%     noverlap=length(window)/2;   %分段重叠长度
%     
%     [p,f] = pwelch(dataToAnalyze ,window,noverlap,nfft,SampFreq);
%     [power,index] = max(p(fLbound/0.002:fUbound/0.002));          %1.97Hz上下浮动10%范围
%     FirstFreq(i) = f(index+fLbound/0.002-1);
% end

% figure(1)
% boxplot(FirstFreq)

%pwelch(data,window,noverlap,nfft,SampFreq);

