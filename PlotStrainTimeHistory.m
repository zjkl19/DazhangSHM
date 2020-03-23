%% 绘制应变时程曲线
%% 要提前算好strain变量，每1列表示每个通道的数据

channelSelect=1;

dataSize=size(totalData,1);
plot(1:dataSize,strain(1:dataSize,channelSelect),'DisplayName','strain')

%'Color',[1 1 1]表示白色

%以下3行for循环验证时间刻度划分是否均匀
% for i=1:10
%     text(fix(dataSize*i/10),strain(fix(dataSize*i/10),1),xtime{1}{fix(dataSize*i/10),1})
% end

%set(gca,'xticklabel',mat2cell(xticklabelMat));
set(gca,'xtick',1:fix(dataSize/12):dataSize);
set(gca,'xticklabel',{'0:00','02:00', '04:00','06:00' ,'08:00' ,'10:00', '12:00', '14:00', '16:00', '18:00', '20:00', '22:00', '24:00'});
xlim(gca,[1,dataSize]);
xlabel('时间');
ylabel('应变(με)');
grid;