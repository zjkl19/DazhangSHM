%% 绘制频率时程曲线
%% 要提前算好FirstFreq变量

yellowAlert=4.9;redAlert=4.80;

dataSize=size(FirstFreq,2);
%plot(1:dataSize,FirstFreq)
scatter(1:dataSize,FirstFreq,'b','o')
 line([1 dataSize],[yellowAlert yellowAlert],'color',[1 165/255 0],'linewidth',1)    %黄色预警线

line([1 dataSize],[redAlert redAlert],'color','r','linewidth',1)    %红色预警线
        
set(gca,'xtick',1:dataSize);
set(gca,'xticklabel',{'0:00','','','','02:00','','','', '04:00','','','','06:00' ,'','','','08:00' ,'','','','10:00', '','','','12:00','','','', '14:00', '','','','16:00', '','','','18:00','','','', '20:00', '','','','22:00','','', '24:00'});
xlim(gca,[1,dataSize]);
ylim(gca,[4.7,5.4])
xlabel('时间');
ylabel('基频(Hz)');
grid;