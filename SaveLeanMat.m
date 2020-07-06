function outputArg = SaveLeanMat(sampFreq,folderName,timeStr,channel)
%�����ݿ�����ȡ����ͨ��������ݣ�����ָ��Ŀ¼�б���ΪMat
%   sampFreq������Ƶ�ʣ�����sampFreq = 20;
%   folderName���ļ������ƣ�����folderName='DazhangMat';
%   TimeStr��ʱ���ַ���������timeStr='20200528';
%   channel��ͨ��������channel=["C1802190792","C1802190793","C1802190794","C1802190795"];

%����mat����Ҫ�Ĳ���

%����
%folderName='DazhangMat';
%dayStr='0528';
fileName = ['lean',timeStr,'.mat'];

%����   Ix-1, Iy-1, Ix-2, Iy-2
%channel=["CH32-1","CH32-2","CH32-3","CH32-4"];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table=['D',timeStr];

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��
%ostrain= zeros(1728000,length(channel));    %ԭʼӦ������
%strain(:,i)��ʾ��i��ͨ��������
%strain= zeros(1728000,length(channel));

%xtime{i}��ʾ��i��Ӧ��ͨ����Ӧ��ʱ������
%cell2mat���ڲ�ͬʱ���ַ������Ȳ�ͬ��ʱ�޷�ʹ��

%����ʱ��ο�:
%1728000������firhighpass(value,[0.01 0.02],SampFreq)��Լ��ʱ40s��
%1728000������firhighpass(value,[0.003 0.005],SampFreq)��Լ��ʱ160s��
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*sampFreq);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
 
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
    olean(1:length(value),i)=value;
    
    lean(1:length(value),i)=olean(1:length(value),i);
    lean(:,i)=ProcessZeroData(lean(:,i));
    %lean(find(lean(1:length(value),i)> 3),i)=0;
    %lean(find(lean(1:length(value),i)<-3),i)=0;
   
    lean(:,i)=lean(:,i)-mean(lean(:,i));
end

save([folderName,'\',fileName]);
outputArg=1;
end

