
%positionAndSize=[500,350,600,300];
positionAndSize=[237,358,320,230];

%坐标横轴
%林迪南注：例：1.3-0.7，13.3-12.7为预警线的“长度”

Temperature=[];

itemSelect=6;

if  itemSelect==1
    %2020年1月
    Temperature(:,1)=[6.5 11 16 22 26]';
    Temperature(:,2)=[6.7 10.9 15.2 20 24]';
    Temperature(:,3)=[6.8 10.7 15.5 19 23.5]';
    Temperature(:,4)=[4.5 8 16 22 26]';
elseif itemSelect==2
    %2020年2月
    Temperature(:,1)=[8 11 17 24 27]';
    Temperature(:,2)=[7 10 16 22 25]';
    Temperature(:,3)=[6.2 8.5 17 21 24.5]';
    Temperature(:,4)=[4.5 7 16 23 26]';
elseif itemSelect==3
    %2020年3月
    Temperature(:,1)=[8 12.8 15.6 17 22.5]';
    Temperature(:,2)=[9.5 13.6 16.8 18.3 21]';
    Temperature(:,3)=[8.5 13.3 15.7 16.8 20.5]';
    Temperature(:,4)=[7.5 12.7 15 16 19.8]';
elseif itemSelect==4
    %2020年4月
    Temperature(:,1)=[5 10.5 21 26 29.5]';
    Temperature(:,2)=[6 10 20.5 24.5 28]';
    Temperature(:,3)=[5.5 9.8 20.6 23.8 27.5]';
    Temperature(:,4)=[4 8.8 20.3 25 32]';
elseif itemSelect==5
    %2020年5月
    Temperature(:,1)=[19 19.3 22.7 26 27.1]';
    Temperature(:,2)=[18.8 19.1 22.0 25.0 25.8]';
    Temperature(:,3)=[19.2 19.5 22.2 25.4 26.0]';
    Temperature(:,4)=[18.9 19.3 22.5 26.3 27.3]';
elseif itemSelect==6
    %2020年6月
    Temperature(:,1)=[21 21.3 28.2 35.3 37.1]';
    Temperature(:,2)=[22 22.4 28.2 34.5 35.8]';
    Temperature(:,3)=[24 24.3 30.0 36.8 38.0]';
    Temperature(:,4)=[21 21.5 27.8 36.0 37.8]';
end
boxplot(Temperature,'whisker',10000,'symbol','b+','color','b')
set(gca,'xtick',1:4,'fontsize',8);
set(gca,'xticklabel',{'T-1','T-2', 'T-3','T-4'},'fontsize',8);

ylim(gca,[0,40]);

%set(gca,'yticklabel',{'21','23', '25','27','29', '31','33','35', '37', '39'},'fontsize',8);

%set(gca,'yticklabel',{'5','8.5', '12','15.5','19', '22.5','26','29.5'},'fontsize',8);
%set(gca,'yticklabel',{'3','6', '9','12','15', '18','21','24', '27', '30'},'fontsize',8);
%set(gca,'yticklabel',{'3','6', '9','12','15', '18','21','24', '27', '30'},'fontsize',8);
%set(gca,'yticklabel',{'4','8', '12','15','19', '23','27','24', '27', '30'},'fontsize',8);


xlabel('传感器编号','fontsize',8);
ylabel('温度（ ℃ ）','fontsize',8);
%ylim(gca,[5,35]);    %12月
%ylim(gca,[10,18]);    %1月
%ylim(gca,[17,26]);
%ylim(gca,[16,25]);    %3月
set(gcf,'position',positionAndSize);