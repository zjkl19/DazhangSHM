datasource = 'MatlabTestLink'; %ǰ�����õ�����Դ����
 
connA = database(datasource,'sa','jky123!'); %SQL Server���û���������
 
cursorA=exec(connA,'select MonitorDateTime,Channel,Value from D1108 where Channel=272'); %���ݿ����ơ�������
 
RowLimit = 24*3600*20; % RowLimitΪÿ�ζ�ȡ�����ݲ�����������Ĭ��Ϊȫ����ȡ
 
cursA=fetch(cursorA,RowLimit); % �����ݿ��е����ݶ�ȡ��Matlab�С���fetch
 
%������������ΪԪ����cell���ͣ�Ĭ��ΪCELL�ͣ�Ҫͨ�� cell2mat() ת����ʽ
 
DataA=cursA.Data; %�Ѷ�ȡ���������ñ���Data����.
 
%�ر�����
close(cursorA);
 
close(connA);