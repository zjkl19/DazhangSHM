

%%
%����Ƶ������ͼ

figure(1)
hold on

%�������
%�ֵ���ע������1.3-0.7��13.3-12.7ΪԤ���ߵġ����ȡ�
x = [0.7:4.7;
     1.3:5.3]';
% Ԥ��ֵ
%������2�б�ʾ��2��Ӧ�����[��ɫԤ�����ޣ���ɫԤ�����ޣ���ɫԤ�����ޣ���ɫԤ������]
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

%boxplot(strain,'whisker',100,'symbol','b+')
boxplot(strain,'whisker',10000)  
set(gca,'xtick',1:4);
set(gca,'xticklabel',{'Sx-1','Sx-2', 'Sx-3','Sx-4'});
xlabel('���������');
ylabel('Ӧ��(�̦�)');
ylim(gca,[-30,180]);




