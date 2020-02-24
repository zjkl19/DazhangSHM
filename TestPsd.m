
%%
%����1�����ݵ�psd����ͼ

%TODO����ȡ������1��Class�ع�
datasource = 'MatlabTestLink'; %ǰ�����õ�����Դ����
connA = database(datasource,'sa','jky123!'); %SQL Server���û���������
%272ͨ����������м��ٶ�
cursorA=exec(connA,'select MonitorDateTime,Channel,Value from D1108 where Channel=272'); %���ݿ����ơ�������
RowLimit = 24*3600*20; % RowLimitΪÿ�ζ�ȡ�����ݲ�����������Ĭ��Ϊȫ����ȡ
%��cursA=fetch(cursorA)����������
cursA=fetch(cursorA,RowLimit); % �����ݿ��е����ݶ�ȡ��Matlab�С���fetch
 
%������������ΪԪ����cell���ͣ�Ĭ��ΪCELL�ͣ�Ҫͨ�� cell2mat() ת����ʽ
DataA=cursA.Data; %�Ѷ�ȡ���������ñ���Data����.
 
%�ر�����
close(cursorA);
close(connA);


ValueColIndex=3;   %ֵ����������

SampFreq = 20;     % ����Ƶ��
data=cell2mat(cursA.Data(:,ValueColIndex));

% L=length(data);    %���ݳ���
% nfft=2^nextpow2(L);
% window=hamming(nfft/10);    %��10��
% noverlap=length(window)/2;   %�ֶ��ص�����

%%
% ÿ5minʶ��һ��Ƶ�ʣ�ÿ�����ݳ�1h

fLbound=3.87*0.9;fUbound=3.87*1.1;

tSpan = SampFreq*60*60;   %����ʱ��
tInterval = SampFreq*60*30;   %ÿ��ʶ����30min����λ��s��

for i = 1:length(data)/tInterval
    startTime = (i-1)*tInterval+1;              %ʶ��ʼ���
    endTime =min(startTime+tSpan-1,L);   %ʶ��������
    
    dataToAnalyze = data(startTime:endTime,1);
    L=length(dataToAnalyze);
    nfft=2^nextpow2(L);
    window=hamming(nfft/10);    %��10��
    noverlap=length(window)/2;   %�ֶ��ص�����
    
    [p,f] = pwelch(dataToAnalyze ,window,noverlap,nfft,SampFreq);
    [power,index] = max(p(fLbound/0.002:fUbound/0.002));          %1.97Hz���¸���10%��Χ
    FirstFreq(i) = f(index+fLbound/0.002-1);
end

figure(1)
boxplot(FirstFreq)

%pwelch(data,window,noverlap,nfft,SampFreq);

