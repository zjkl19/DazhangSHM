
%%
%����1�����ݵ�psd����ͼ
clear;
clc;

tic;
SampFreq = 20;     % ����Ƶ��
channel=279;
ValueColIndex=3;   %ֵ����������
table='D1115';

%ԭʼ���ݣ��������ڣ�ͨ����ֵ
totalData=GetDataFromSqlServer(table,channel,24*3600*20);

%ֻȡ��ֵ��
value=cell2mat(totalData(:,ValueColIndex));

%�˲��������
postData = firhighpass(value,[0.01 0.02],SampFreq);
toc;
plot(postData)


