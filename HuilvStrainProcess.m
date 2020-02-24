
%%
tic;
%clear
%close all
SampFreq = 20;     % ����Ƶ��

%%
%load('D:\Monitoring data\Huilv\2019\1103.mat')

% ��ȡͨ����
b1 = indata{1};
% ��ȡ��ֵ
b2 = indata{2};

%Ӧ��
strain = zeros(1728000,13);
for i = 1:13
  sensor = i+274; 
  index = find(b1==sensor);
  len = length(index);
  a = b2(index);
  a(a==0) = mean(a);
  strain(1:len,i) = a;
  strain2(:,i)=strain(:,i);     %�Լ���ӣ��ֵ��ϣ�
  strain2(:,i) = firhighpass(strain(:,i),[0.01 0.02],SampFreq);
end

index = find(strain2(:,11)>6.234);
strain2(index,11) = 6.234;

%%
figure(1)
hold on

%�������
x = [0.7:12.7;
     1.3:13.3]';
% Ԥ��ֵ
%������2�б�ʾ��2��Ӧ�����[��ɫԤ�����ޣ���ɫԤ�����ޣ���ɫԤ�����ޣ���ɫԤ������]
y = [-22 39 -29 51;
     -21 29 -28 38;
     -22 39 -29 51;
     -15 29 -25 48;
     -13 18 -23 33;
     -15 29 -25 48;
     -22 39 -29 51;
     -21 29 -28 38;
     -22 39 -29 51;
     -25  7 -39  9;
     -25  7 -30 10;
     -25  7 -30 10;
     -25  7 -39  9;
     ]';

for i = 1:13
    for j = 1:2
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color',[1 165/255 0],'linewidth',1)
    end
    for j = 3:4
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color','r','linewidth',1)
    end
end
toc;
boxplot(strain2,'whisker',100,'symbol','b+')






