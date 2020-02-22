%%
% ����������ȡ����ͳһ���²���
% ת��Ϊ��׼��λ  �� �� Ӧ�� ţ

clear
close all
SampFreq = 25;     % �ز���Ƶ��

%% ���������ȡ
% ����InclData��

filename = '1108.txt';
fid     = fopen(filename);
indata  = textscan(fid,'%s %s %s %s %s');   
fclose(fid);

% ��ȡʱ�䣬
c = cellstr(indata{2});
d = char(c);
InclTime = str2num(d(:,[1 2 4 5 7 8 10]));     % ʱ�䣬��ȷ��0.1s  10Hz
[C,ia,ib] = unique(InclTime);
clear c d C ib InclTime

% ��ȡ��Ӧ�����ֵ ���ز���Ϊ25Hz
for i = 1:11
    l = [1 1 1 1 0 1 1 0 1 0 0];   % ���������ֵ����Ϊ0 ��Ϊ1
    a = char(indata{i+2});      % cellת��Ϊ�ַ�
    b = str2num(a(ia,end-5-l(i):end));      % �ַ�ת��Ϊ����,��ֵ��Ҫ�����һ������
    c = resample(b,SampFreq,10,0);       % �ı�Filter��������ø��õ�Ч��
    InclData(:,i) = c;
end
clear a b c d l ia


%% ���˹�դ������ȡ����

% ��������
dir     = 'D:\FangCloudSync\My expriment\Test Data\20170831\ԭʼ����';
file    = 'CH_1_20170831_142028';                          % ��������һ���ļ���
date    = file(end-15:end);                      %  ��ȡ�ļ����е�����

% Ӧ����ȡ CH1~CH11
% StrData
for i = 1:11
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f %f %f %f %f ');   
    fclose(fid);
    a = cell2mat(indata([4 6 8]));       % Ӧ��ֵ������
    StrData(:,(i-1)*3+1:i*3) = resample(a,SampFreq*2,12.5*2);
end
StrData = StrData*1e-6;         % ΢Ӧ��ת��ΪӦ��

% λ����ȡ CH13~CH15���ڶ�������Ϊλ��ֵ
% DispData
for i = 13:14
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f');   
    fclose(fid);    
    a = cell2mat(indata([6]));
    DispData(:,i-12) = -resample(a,SampFreq*2,12.5*2);
end

% �����¶ȼ� CH12 CH16
% TempData
for i = 12
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f');   
    fclose(fid);    
    a = cell2mat(indata([4]));
    TempData(:,1) = resample(a,SampFreq*2,12.5*2);
end

for i = 16
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f');   
    fclose(fid);    
    a = cell2mat(indata([4]));
    TempData(:,2) = resample(a,SampFreq*2,12.5*2);
end    

% �ṹ�¶� CH17
% TempData
for i = 17
    filename    = strcat([dir,'\CH_',num2str(i),date,'.txt']);
    fid     = fopen(filename);
    indata  = textscan(fid,'%s %s %f %f %f %f %f %f %f %f %f %f %f %f %f %f');   
    fclose(fid);    
    tData = cell2mat(indata([4 6 8 10 12 14 16]));       % �ṹ�¶ȼ�λ��17ͨ����ʱ����ǰ16������ͬ���������������΢����
    tData = resample(tData,SampFreq*2,12.5*2);
end    
TempData(:,3:9) = tData(1:size(StrData,1),:);
clear tData

%% ����������ȡ
load 'D:\FangCloudSync\My expriment\Test Data\20170831\ԭʼ����\20170831.mat';

% ֧���������˲�Ϊ25Hz
% RfData
Datas = Datas(:,12:19);
for i = 1:8
    RfData(:,i) = resample(Datas(:,i),SampFreq,200);
end
clear Datas


%% ��������
save AllData InclData DispData StrData TempData RfData



