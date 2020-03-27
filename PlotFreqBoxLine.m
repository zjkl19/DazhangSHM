

%%
%绘制频率箱线图

figure(1)
hold on

%freqSelectSize=size(FirstFreq,1);    %boxplot分析的数据个数
freqSelectSize=26;

%通过set指令可以指定图像大小，语法为set(gcf,'position',[centerX,centerY,width,height])
positionAndSize=[500,350,600,300];

% 预警值
%例：第2行表示第2个测点的[黄色预警下限，黄色预警上限，红色预警下限，红色预警上限]
y = [4.90 4.90 5.00 5.00;
     4.90 4.90 5.00 5.00;
     4.90 4.90 5.00 5.00;
     ]';
 
 %坐标横轴
%林迪南注：例：1.3-0.7，13.3-12.7为预警线的“长度”
x = [0.7:size(y,2)+0.7;
     1.3:1+size(y,2)+0.3]';

for i = 1:size(y,2)
    for j = 1:2
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color','r','linewidth',1)
    end
    for j = 3:4
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color',[1 165/255 0],'linewidth',1)
    end
end

%boxplot(strain,'whisker',100,'symbol','b+')
boxplot(FirstFreq(1:freqSelectSize,:),'whisker',10000,'color','b')  
set(gca,'xtick',1:4);
set(gca,'xticklabel',{'Az-1','Az-2', 'Az-3'});
xlabel('传感器编号');
ylabel('频率(Hz)');
ylim(gca,[4.5,6.0]);
set(gcf,'position',positionAndSize)




