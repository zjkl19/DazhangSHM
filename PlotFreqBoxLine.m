

%%
%����Ƶ������ͼ

figure(1)
hold on

%freqSelectSize=size(FirstFreq,1);    %boxplot���������ݸ���
freqSelectSize=26;

%ͨ��setָ�����ָ��ͼ���С���﷨Ϊset(gcf,'position',[centerX,centerY,width,height])
positionAndSize=[500,350,600,300];

% Ԥ��ֵ
%������2�б�ʾ��2������[��ɫԤ�����ޣ���ɫԤ�����ޣ���ɫԤ�����ޣ���ɫԤ������]
y = [4.90 4.90 5.00 5.00;
     4.90 4.90 5.00 5.00;
     4.90 4.90 5.00 5.00;
     ]';
 
 %�������
%�ֵ���ע������1.3-0.7��13.3-12.7ΪԤ���ߵġ����ȡ�
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
xlabel('���������');
ylabel('Ƶ��(Hz)');
ylim(gca,[4.5,6.0]);
set(gcf,'position',positionAndSize)




