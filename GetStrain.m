%% �����ݿ�����ȡ1���Ӧ�����ݣ�������ȡ�����ݽ����˲�
%% ��ȡ���������η��ڸ�����
%% strain:��ȡ�������

%����1�����ݵ�psd����ͼ
clear;
clc;

tic;
SampFreq = 20;     % ����Ƶ��

%������   SX1,SX2,SX3,SX4,SX5
%=[275,276,277,278,279,280,281,282,283,284,285,286,287];

%����   SX4,SX3,SX2,SX1
channel=[541,542,543,544];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table='D20200114';

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��
%strain(:,i)��ʾ��i��ͨ��������
strain= zeros(1728000,length(channel));

%xtime{i}��ʾ��i��Ӧ��ͨ����Ӧ��ʱ������
%cell2mat���ڲ�ͬʱ���ַ������Ȳ�ͬ��ʱ�޷�ʹ��

for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,channel(i),24*3600*20);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
       
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
        
    %�˲��������
    %postData = firhighpass(value,[0.01 0.02],SampFreq);
    strain(1:length(value),i)=firhighpass(value,[0.01 0.02],SampFreq);    %�˲��������
end

toc;
% plot(postData)


