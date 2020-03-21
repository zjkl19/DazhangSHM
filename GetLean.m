%% �����ݿ�����ȡ1����������
%% ��ȡ���������η��ڸ�����
%% lean:��ȡ�������

clear;
clc;

tic;
SampFreq = 20;     % ����Ƶ��

%����   Ix-1, Iy-1, Ix-2, Iy-2
%channel=[549 550 551 552];
channel=[549 550 551 552];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table='D20200114';

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��

%lean(:,i)��ʾ��i��ͨ��������
olean= zeros(SampFreq*60*60*24,length(channel));
lean= zeros(SampFreq*60*60*24,length(channel));
%xtime{i}��ʾ��i��ͨ����Ӧ��ʱ������
%cell2mat���ڲ�ͬʱ���ַ������Ȳ�ͬ��ʱ�޷�ʹ��

%����ʱ��ο�:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,channel(i),24*3600*SampFreq);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
       
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
    olean(1:length(value),i)=value;
    
    lean(1:length(value),i)=olean(1:length(value),i);
    lean(find(lean(1:length(value),i)> 3),i)=0;
    lean(find(lean(1:length(value),i)<-3),i)=0;
    lean(:,i)=ProcessZeroData(lean(:,i));
    lean(:,i)=lean(:,i)-mean(lean(:,i));
    
end

toc;


