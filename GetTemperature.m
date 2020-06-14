%% �����ݿ�����ȡ1����¶�����
%% ��ȡ���������η��ڸ�����
%% Temperature:��ȡ�������

clc;

tic;
SampFreq = 20;     % ����Ƶ��

%����mat����Ҫ�Ĳ���
folderName='DazhangMat';
dayStr='0528';
fileName = ['temperature',dayStr,'.mat'];

%����   T-1, T-2, T-3, T-4
channel=["CH33-1","CH33-2","CH33-3","CH33-4"];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table=['D2020',dayStr];

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��

%Temperature(:,i)��ʾ��i��ͨ��������
%oTemperature= zeros(SampFreq*60*60*24,length(channel));
%Temperature= zeros(SampFreq*60*60*24,length(channel));
%xtime{i}��ʾ��i��ͨ����Ӧ��ʱ������
%cell2mat���ڲ�ͬʱ���ַ������Ȳ�ͬ��ʱ�޷�ʹ��

%����ʱ��ο�:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*SampFreq);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
       
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
    oTemperature(1:length(value),i)=value;   
    
    Temperature(1:length(value),i)=oTemperature(1:length(value),i);
    
    Temperature(find(Temperature(1:length(value),i)> 50),i)=0;
    Temperature(find(Temperature(1:length(value),i)<-50),i)=0;
    
    Temperature(:,i)=ProcessZeroData(Temperature(:,i));
    
end

save([folderName,'\',fileName]);

toc;


