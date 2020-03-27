
%%
%测试1天数据的psd曲线图

SampFreq = 20;     % 采样频率
div=10;
% L=length(acc);    %数据长度
% nfft=2^nextpow2(L/div);
% window=hamming(4096);    %分10段
% noverlap=length(window)/2;   %分段重叠长度
% [p,f]=pwelch(acc(1:fix(L/div)) ,window,noverlap,nfft,SampFreq);

%%
% 每5min识别一次频率，每次数据长1h

fLbound=[5.0 5.0 5.0];fUbound=[5.8 6.0 5.8];    %每个通道识别的上界的下界
% 
tSpan = SampFreq*60*30;   %计算时长

for i=1:size(acc,2)
    for j = 1:fix(length(acc)/tSpan)
        startTime = (j-1)*tSpan+1;              %识别开始结点
        endTime =min(startTime+tSpan,length(acc));   %识别结束结点

        dataToAnalyze = acc(startTime:endTime,i);
        L=length(dataToAnalyze);
        %nfft取值依据：分辨率fs/nfft<0.01=>nfft>fs/0.01=2000，取4096
        nfft=4096;
        window=hamming(nfft);    %分10段
        noverlap=fix(length(window)/2);   %分段重叠长度

        [p,f] = pwelch(dataToAnalyze ,window,noverlap,nfft,SampFreq);

        %指定频率搜索的范围
        firstIndex=find(f>fLbound(i),1,'first'); lastIndex=find(f>fUbound(i),1,'first');
        %要注意到p和f的索引是一 一对应的
        [power,index] = max(p(firstIndex:lastIndex));          
        FirstFreq(j,i) = f(firstIndex+index-1);
    end
end

%figure(1)
%boxplot(FirstFreq)

%pwelch(data,window,noverlap,nfft,SampFreq);

