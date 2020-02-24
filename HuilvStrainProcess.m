
%%
tic;
%clear
%close all
SampFreq = 20;     % 采样频率

%%
%load('D:\Monitoring data\Huilv\2019\1103.mat')

% 获取通道号
b1 = indata{1};
% 获取数值
b2 = indata{2};

%应变
strain = zeros(1728000,13);
for i = 1:13
  sensor = i+274; 
  index = find(b1==sensor);
  len = length(index);
  a = b2(index);
  a(a==0) = mean(a);
  strain(1:len,i) = a;
  strain2(:,i)=strain(:,i);     %自己添加（林迪南）
  strain2(:,i) = firhighpass(strain(:,i),[0.01 0.02],SampFreq);
end

index = find(strain2(:,11)>6.234);
strain2(index,11) = 6.234;

%%
figure(1)
hold on

%坐标横轴
x = [0.7:12.7;
     1.3:13.3]';
% 预警值
%例：第2行表示第2个应变测点的[黄色预警下限，黄色预警上限，红色预警下限，红色预警上限]
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






