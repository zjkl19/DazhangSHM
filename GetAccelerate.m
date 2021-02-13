%% �����ݿ�����ȡ1��ļ��ٶ�����
%% ��ȡ���������η��ڸ�����
%% acc:��ȡ�������

clc;

tic;
SampFreq = 20;     % ����Ƶ��

%����mat����Ҫ�Ĳ���
folderName='DazhangMat';
dayStr='0705';
fileName = ['accelerate',dayStr,'.mat'];

%����   Az-1, Az-2, Az-3
channel=["CH19-1","CH210-1","CH311-1"];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table=['D2020',dayStr];

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��

%acc(:,i)��ʾ��i��ͨ��������
%acc= zeros(1728000,length(channel));

%xtime{i}��ʾ��i��ͨ����Ӧ��ʱ������
%cell2mat���ڲ�ͬʱ���ַ������Ȳ�ͬ��ʱ�޷�ʹ��

%����ʱ��ο�:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*20);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
       
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    %xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
    value=ProcessZeroData(value);
    acc(1:length(value),i)=value;
end

save([folderName,'\',fileName]);

toc;


