
%%
%����1�����ݵ�psd����ͼ
clear;
clc;

tic;
SampFreq = 20;     % ����Ƶ��

%������   SX1,SX2,SX3,SX4,SX5
%=[275,276,277,278,279,280,281,282,283,284,285,286,287];

%����   SX4,SX3,SX2,SX1
channel=[541,542,543,544];


%������
% | 275 | Ӧ��SX1      | ����1/4����������           |
% | 276 | Ӧ��SX2      | ����1/4������������         |
% | 277 | Ӧ��SX3      | ����1/4����������           |
% | 278 | Ӧ��SX4      | ��������                    |
% | 279 | Ӧ��SX5      | �������                    |
% | 280 | Ӧ��SX6      | ���ж���                    |
% | 281 | Ӧ��SX7      | ����3/4���ϣ�����           |
% | 282 | Ӧ��SX8      | ����3/4���ϣ�������         |
% | 283 | Ӧ��SX9      | ����3/4���ϣ�����           |
% | 284 | Ӧ��SX10     | ���������Σ�                |
% | 285 | Ӧ��SX11     | ����                        |
% | 286 | Ӧ��SX12     | ����                        |
% | 287 | Ӧ��SX13     | ���������Σ�                |

valueColIndex=3;   %ֵ����������
table='D20200114';

%TODO:���Ǹ���ͨ��Ӧ��ά�Ȼ᲻�᲻һ��
strain= zeros(1728000,length(channel));

for i = 1:length(channel)
    totalData=GetDataFromSqlServer(table,channel(i),24*3600*20);    %ԭʼ���ݣ��������ڣ�ͨ����ֵ
    value=cell2mat(totalData(:,valueColIndex));    %ֻȡ��ֵ��
    %�˲��������
    %postData = firhighpass(value,[0.01 0.02],SampFreq);
    strain(1:length(value),i)=firhighpass(value,[0.01 0.02],SampFreq);    %�˲��������
end

toc;
% plot(postData)


