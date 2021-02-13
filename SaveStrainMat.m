function outputArg = SaveStrainMat(sampFreq,folderName,timeStr,channel)
%�����ݿ�����ȡ����ͨ��Ӧ�����ݣ�����ָ��Ŀ¼�б���ΪMat
%   sampFreq������Ƶ�ʣ�����sampFreq = 20;
%   folderName���ļ������ƣ�����folderName='DazhangMat';
%   TimeStr��ʱ���ַ���������timeStr='20200528';
%   channel��ͨ��������channel=["C1802190792","C1802190793","C1802190794","C1802190795"];

%����mat����Ҫ�Ĳ���

%����
%folderName='DazhangMat';
%dayStr='0528';
fileName = ['strain',timeStr,'.mat'];

%����   SX1,SX2,SX3,SX4
%channel=["C1802190792","C1802190793","C1802190794","C1802190795"];

timeColIndex=1;    %ʱ������������
valueColIndex=3;   %ֵ����������

table=['D',timeStr];

for i = 1:l360ength(channel)
    totalData=GetDataFromSqlServer(table,char(channel(i)),24*3600*sampFreq);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
       
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    xtime{i}=totalData(:,timeColIndex);    %��ȡʱ��
    value=ProcessZeroData(value);
    %�˲��������
    %postData = firhighpass(value,[0.01 0.02],SampFreq);
    ostrain(1:length(value),i)=value;
    strain(1:length(value),i)=firhighpass(value,[0.003 0.005],sampFreq);    %�˲��������
end

save([folderName,'\',fileName]);
outputArg=1;
end

