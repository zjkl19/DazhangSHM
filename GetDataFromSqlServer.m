%% ��Sql Server�ж�ȡʹ���ڴ���������
%% ������������ΪԪ����cell���ͣ�Ĭ��ΪCELL�ͣ�Ҫͨ�� cell2mat() ת����ʽ
%% table������
%% channel��ͨ��
%% rowLimit��Ϊÿ�ζ�ȡ�����ݲ�����������Ĭ��Ϊȫ����ȡ

%���ݴӶ��ϴ�ѧ������������intellibridge.cn
%TODO����ȡ������1��Class�ع�
function outdata=GetDataFromSqlServer(table,channel,rowLimit)
datasource = 'MatlabTestLink'; %ODBC����Դ���ƣ�win10���� ODBC����Դ��
connA = database(datasource,'sa','jky123!'); %SQL Server���û���������
%279ͨ�����������Ӧ��
connStr=['select MonitorDateTime,Channel,Value from [',table,'] where Channel=',num2str(channel)];
cursorA=exec(connA,connStr); %���ݿ����ơ�������
%RowLimit = 24*3600*20; 
%��cursA=fetch(cursorA)����������
cursA=fetch(cursorA,rowLimit); % �����ݿ��е����ݶ�ȡ��Matlab�С���fetch
 
%������������ΪԪ����cell���ͣ�Ĭ��ΪCELL�ͣ�Ҫͨ�� cell2mat() ת����ʽ
close(cursorA);
close(connA);
outdata = cursA.Data;