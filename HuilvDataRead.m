%%
clear
close all
tic;
SampFreq = 20;     % �ز���Ƶ��

%%
filename = 'C:\VsProjects\DazhangSHM\MonitorData\2020-01-14.txt';
fid     = fopen(filename);
% ��ȡ�ı���*��ʾ�����ı�
indata  = textscan(fid,'%*s %*s %d %*d %f');   
fclose(fid);


%%
% ��ȡͨ����
b1 = indata{1};
% ��ȡ��ֵ
b2 = indata{2};

% ָ������ͨ����
sensor =542;
index = find(b1==sensor);
data = b2(index);
toc;
