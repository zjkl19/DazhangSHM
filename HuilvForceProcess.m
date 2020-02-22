%%
clear
close all
SampFreq = 20;     % ����Ƶ��

%%
load('D:\Monitoring data\Huilv\2019\1102.mat')

% ��ȡͨ����
b1 = indata{1};
% ��ȡ��ֵ
b2 = indata{2};

% ��
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
% ÿ5minʶ��һ��Ƶ�ʣ�ÿ�����ݳ�10min
tSpan = SampFreq*60*10;   %����ʱ��
tInterval = SampFreq*60*10;   %ÿ��ʶ����10min

for j = 1:4
    for i = 1:max(size(acc2))/tInterval
        startTime = (i-1)*tInterval+1;              %ʶ��ʼʱ���
        endTime =min(startTime+tSpan-1,max(size(acc2)));   %ʶ�����ʱ���
        a = acc2(startTime:endTime,j);
        [p,f] = pwelch(a,2000,1000,2000,SampFreq);
        [power,index] = max(p(4.3/0.01:5.6/0.01));          %���أ�4.9Hz���¸�10%��4.41��,���أ�5.3���ϸ�0%��5.53��
        FirstFreq(i,j) = f(index+4.3/0.01-1);
    end
end

Force = 4*8000*3245.5*1e-6*20.644^2*FirstFreq.^2/1000;

boxplot(FirstFreq)





