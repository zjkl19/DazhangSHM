%% �����ݿ�����ȡ1��ļ��ٶ�����
%% ��ȡ���������η��ڸ�����
%% acc:��ȡ�������

clear;
clc;

tic;
SampFreq = 20;     % ����Ƶ��

%����   Az-1, Az-2, Az-3
%channel=[538 539 540];

channel=[538 539 540];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table='D20200408';

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��

%acc(:,i)��ʾ��i��ͨ��������
acc= zeros(1728000,length(channel));

%xtime{i}��ʾ��i��ͨ����Ӧ��ʱ������
%cell2mat���ڲ�ͬʱ���ַ������Ȳ�ͬ��ʱ�޷�ʹ��

%����ʱ��ο�:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,channel(i),24*3600*20);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
       
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    %xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
    value=ProcessZeroData(value);
    acc(1:length(value),i)=value;
end

toc;


