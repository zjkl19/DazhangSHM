

%%
%�����¶�����ͼ

positionAndSize=[500,350,600,300];

%�������
%�ֵ���ע������1.3-0.7��13.3-12.7ΪԤ���ߵġ����ȡ�
x = [0.7:4.7;
     1.3:5.3]';

boxplot(Temperature,'whisker',10000,'symbol','b+','color','b')
set(gca,'xtick',1:4,'fontsize',8);
set(gca,'xticklabel',{'T-1','T-2', 'T-3','T-4'},'fontsize',8);


set(gca,'yticklabel',{'19','20', '21','22','23', '24','25','26', '27', '28'},'fontsize',8);

%set(gca,'yticklabel',{'5','8.5', '12','15.5','19', '22.5','26','29.5'},'fontsize',8);
%set(gca,'yticklabel',{'3','6', '9','12','15', '18','21','24', '27', '30'},'fontsize',8);
%set(gca,'yticklabel',{'3','6', '9','12','15', '18','21','24', '27', '30'},'fontsize',8);
%set(gca,'yticklabel',{'4','8', '12','15','19', '23','27','24', '27', '30'},'fontsize',8);


xlabel('���������','fontsize',8);
ylabel('�¶ȣ� �� ��','fontsize',8);
%ylim(gca,[5,35]);    %12��
%ylim(gca,[10,18]);    %1��
%ylim(gca,[17,26]);
%ylim(gca,[16,25]);    %3��
set(gcf,'position',positionAndSize);

folderName='DazhangMat';
saveas(gcf, [folderName,'\','TemperatureBoxPlot'], 'fig');
saveas(gcf, [folderName,'\','TemperatureBoxPlot'], 'emf');
%close;




