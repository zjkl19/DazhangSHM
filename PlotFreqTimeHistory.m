
%%
%����1�����ݵ�psd����ͼ

SampFreq = 20;     % ����Ƶ��
div=50;
L=length(acc);    %���ݳ���
nfft=2^nextpow2(L/div);
window=hamming(nfft/div);    %��10��
noverlap=length(window)/2;   %�ֶ��ص�����
pwelch(acc(1:fix(L/div)) ,window,noverlap,nfft,SampFreq);

%%
% ÿ5minʶ��һ��Ƶ�ʣ�ÿ�����ݳ�1h

% fLbound=3.87*0.9;fUbound=3.87*1.1;
% 
% tSpan = SampFreq*60*60;   %����ʱ��
% tInterval = SampFreq*60*30;   %ÿ��ʶ����30min����λ��s��
% 
% for i = 1:length(data)/tInterval
%     startTime = (i-1)*tInterval+1;              %ʶ��ʼ���
%     endTime =min(startTime+tSpan-1,L);   %ʶ��������
%     
%     dataToAnalyze = data(startTime:endTime,1);
%     L=length(dataToAnalyze);
%     nfft=2^nextpow2(L);
%     window=hamming(nfft/10);    %��10��
%     noverlap=length(window)/2;   %�ֶ��ص�����
%     
%     [p,f] = pwelch(dataToAnalyze ,window,noverlap,nfft,SampFreq);
%     [power,index] = max(p(fLbound/0.002:fUbound/0.002));          %1.97Hz���¸���10%��Χ
%     FirstFreq(i) = f(index+fLbound/0.002-1);
% end

% figure(1)
% boxplot(FirstFreq)

%pwelch(data,window,noverlap,nfft,SampFreq);

