%% ����Ӧ��ʱ������
%% Ҫ��ǰ���strain������ÿ1�б�ʾÿ��ͨ��������

dataSize=size(totalData,1);
plot(1:dataSize,strain(1:dataSize,1),'DisplayName','strain')

%'Color',[1 1 1]��ʾ��ɫ

%����3��forѭ����֤ʱ��̶Ȼ����Ƿ����
% for i=1:10
%     text(fix(dataSize*i/10),strain(fix(dataSize*i/10),1),xtime{1}{fix(dataSize*i/10),1})
% end

%set(gca,'xticklabel',{' ','Maple', 'Spr','Zm' ,'Bob' ,'Hll', 'Yq'});

%xticklabelMat=zeros(dataSize);
%for i=1:dataSize
%    xticklabelMat(i)=' ';
%end

%set(gca,'xticklabel',mat2cell(xticklabelMat));
set(gca,'xtick',1:fix(dataSize/12):dataSize);
set(gca,'xticklabel',{'0:00','02:00', '04:00','06:00' ,'08:00' ,'10:00', '12:00', '14:00', '16:00', '18:00', '20:00', '22:00', '24:00'});
xlim(gca,[1,dataSize]);
xlabel('ʱ��')
ylabel('Ӧ��(�̦�)')