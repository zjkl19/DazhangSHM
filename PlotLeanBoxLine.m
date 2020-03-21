

%%
%绘制请教箱线图


figure(1)
hold on

%坐标横轴
%林迪南注：例：1.3-0.7，13.3-12.7为预警线的“长度”
x = [0.7:4.7;
     1.3:5.3]';
% 预警值
%例：第2行表示第2个应变测点的[黄色预警下限，黄色预警上限，红色预警下限，红色预警上限]
y = [-0.10 0.10 -0.15 0.15;
     -0.10 0.10 -0.15 0.15;
     -0.10 0.10 -0.15 0.15;
     -0.10 0.10 -0.15 0.15;
     ]';

for i = 1:4
    for j = 1:2
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color',[1 165/255 0],'linewidth',1)
    end
    for j = 3:4
        line([x(i,1) x(i,2)],[y(j,i) y(j,i)],'color','r','linewidth',1)
    end
end

boxplot(lean,'whisker',100,'symbol','b+')
set(gca,'xtick',1:4);
set(gca,'xticklabel',{'Ix-1','Iy-1', 'Ix-2','Iy-2'});
xlabel('传感器编号');
ylabel('倾角(°)');
%ylim(gca,[-10,180]);





