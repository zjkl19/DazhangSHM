%%
%clear
%close all
tic;
SampFreq = 20;     % ����Ƶ��

%%
%load('D:\Monitoring data\Huilv\2019\1102.mat')

% ��ȡͨ����
b1 = indata{1};
% ��ȡ��ֵ
b2 = indata{2};

% ��
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
% ÿ5minʶ��һ��Ƶ�ʣ�ÿ�����ݳ�1h
tSpan = SampFreq*60*60;   %����ʱ��
tInterval = SampFreq*60*30;   %ÿ��ʶ����30min

for j = 1:4
    for i = 1:max(size(acc2))/tInterval
        startTime = (i-1)*tInterval+1;              %ʶ��ʼʱ���
        endTime =min(startTime+tSpan-1,max(size(acc2)));   %ʶ�����ʱ���
        a = acc2(startTime:endTime,j);
        [p,f] = pwelch(a,10000,5000,10000,SampFreq);
        [power,index] = max(p(1.75/0.002:2.2/0.002));          %1.97Hz���¸���10%��Χ
        FirstFreq(i,j) = f(index+1.75/0.002-1);
    end
end
toc;

figure(1)
boxplot(FirstFreq(:,:))




