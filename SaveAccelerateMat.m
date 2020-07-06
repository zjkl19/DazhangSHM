function outputArg1= SaveAccelerateMat(sampFreq,folderName,timeStr,channel)
%�����ݿ�����ȡ����ͨ�����ٶ����ݣ�����ָ��Ŀ¼�б���ΪMat
%   sampFreq������Ƶ�ʣ�����sampFreq = 20;
%   folderName���ļ������ƣ�����folderName='DazhangMat';
%   TimeStr��ʱ���ַ���������timeStr='20200528';
%   channel��ͨ��������channel=["CH19-1","CH210-1","CH311-1"];

%sampFreq = 20;     % ����Ƶ��

fileName = ['accelerate',timeStr,'.mat'];

%����   Az-1, Az-2, Az-3
%channel=["CH19-1","CH210-1","CH311-1"];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table=['D',timeStr];

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��

%acc(:,i)��ʾ��i��ͨ��������
%acc= zeros(1728000,length(channel));

%xtime{i}��ʾ��i��ͨ����Ӧ��ʱ������
%cell2mat���ڲ�ͬʱ���ַ������Ȳ�ͬ��ʱ�޷�ʹ��

%����ʱ��ο�:
for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*sampFreq);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
       
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    %xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
    value=ProcessZeroData(value);
    acc(1:length(value),i)=value;
end

save([folderName,'\',fileName]);

outputArg1 = 1;
end

