%% �����ݿ�����ȡ1���ʱ������
%% xtime:��ȡ�������

%����1�����ݵ�psd����ͼ
clc;

tic;
SampFreq = 20;     % ����Ƶ��


%����   SX4,SX3,SX2,SX1
channel=[541,542,543,544];

valueColIndex=3;   %ֵ����������
table='D20200114';

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��
%strain(:,i)��ʾ��i��ͨ��������
strain= zeros(1728000,length(channel));

for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,channel(i),24*3600*20);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    %�˲��������
    %postData = firhighpass(value,[0.01 0.02],SampFreq);
    strain(1:length(value),i)=firhighpass(value,[0.01 0.02],SampFreq);    %�˲��������
end

toc;
% plot(postData)


