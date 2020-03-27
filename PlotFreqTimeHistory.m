%% ����Ƶ��ʱ������
%% Ҫ��ǰ���FirstFreq����

channelSelect=2;

yellowAlert=5.00;redAlert=4.90;

dataSize=size(FirstFreq,1);
%plot(1:dataSize,FirstFreq)
scatter(1:dataSize,FirstFreq(:,channelSelect),'b','o')
 line([1 dataSize],[yellowAlert yellowAlert],'color',[1 165/255 0],'linewidth',1)    %��ɫԤ����

line([1 dataSize],[redAlert redAlert],'color','r','linewidth',1)    %��ɫԤ����
        
set(gca,'xtick',[1:4:dataSize dataSize]);
%set(gca,'xticklabel',{'0:00','','','','02:00','','','', '04:00','','','','06:00' ,'','','','08:00' ,'','','','10:00', '','','','12:00','','','', '14:00', '','','','16:00', '','','','18:00','','','', '20:00', '','','','22:00','','', '24:00'});
set(gca,'xticklabel',{'0:00','02:00','04:00','06:00','08:00','10:00','12:00','14:00','16:00','18:00', '20:00','22:00', '23:30'});

xlim(gca,[1,dataSize]);
ylim(gca,[4.7,5.5])
xlabel('ʱ��');
ylabel('��Ƶ(Hz)');
grid on;
