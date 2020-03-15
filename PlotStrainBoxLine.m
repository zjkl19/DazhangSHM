

%%
%绘制应变箱线图

%将异常数据置0
for i=1:size(strain,2)
    index = find(strain(:,i)<-100);
    strain(index,i) = 0;
end

figure(1)
hold on

%坐标横轴
%林迪南注：例：1.3-0.7，13.3-12.7为预警线的“长度”
x = [0.7:4.7;
     1.3:5.3]';
% 预警值
%例：第2行表示第2个应变测点的[黄色预警下限，黄色预警上限，红色预警下限，红色预警上限]
y = [-89 89 -156 156;
     -75 75 -151 151;
     -75 75 -151 151;
     -89 89 -156 156;
     ]';

for i = 1:4
    for j = 1:2
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color',[1 165/255 0],'linewidth',1)
    end
    for j = 3:4
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color','r','linewidth',1)
    end
end

boxplot(strain,'whisker',100,'symbol','b+')
set(gca,'xtick',1:4);
set(gca,'xticklabel',{'Sx-1','Sx-2', 'Sx-3','Sx-4'});
xlabel('传感器编号');
ylabel('应变(με)');
ylim(gca,[-10,180]);





