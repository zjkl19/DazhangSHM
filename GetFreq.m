
%%
%����1�����ݵ�psd����ͼ

SampFreq = 20;     % ����Ƶ��
div=10;
% L=length(acc);    %���ݳ���
% nfft=2^nextpow2(L/div);
% window=hamming(4096);    %��10��
% noverlap=length(window)/2;   %�ֶ��ص�����
% [p,f]=pwelch(acc(1:fix(L/div)) ,window,noverlap,nfft,SampFreq);

%%
% ÿ5minʶ��һ��Ƶ�ʣ�ÿ�����ݳ�1h

fLbound=4.5;fUbound=6.0;
% 
tSpan = SampFreq*60*30;   %����ʱ��

for i = 1:fix(length(acc)/tSpan)
    startTime = (i-1)*tSpan+1;              %ʶ��ʼ���
    endTime =min(startTime+tSpan,length(acc));   %ʶ��������
    
    dataToAnalyze = acc(startTime:endTime,1);
    L=length(dataToAnalyze);
    %nfftȡֵ���ݣ��ֱ���fs/nfft<0.01=>nfft>fs/0.01=2000��ȡ4096
    nfft=4096;
    window=hamming(nfft);    %��10��
    noverlap=fix(length(window)/2);   %�ֶ��ص�����
    
    [p,f] = pwelch(dataToAnalyze ,window,noverlap,nfft,SampFreq);
    
    %ָ��Ƶ�������ķ�Χ
    firstIndex=find(f>fLbound,1,'first'); lastIndex=find(f>fUbound,1,'first');
    %Ҫע�⵽p��f��������һ һ��Ӧ��
    [power,index] = max(p(firstIndex:lastIndex));          
    FirstFreq(i) = f(firstIndex+index-1);
end

%figure(1)
%boxplot(FirstFreq)

%pwelch(data,window,noverlap,nfft,SampFreq);

