%% ��Sql Server�ж�ȡʹ���ڴ�������ݣ�1�ζ�ȡ1��ͨ��������
%% ������������ΪԪ����cell���ͣ�Ĭ��ΪCELL�ͣ�Ҫͨ�� cell2mat() ת����ʽ
%% ע�⣺ԭʼ����ʱ��Ϊ��������ʱ��
%% table������
%% channel��ͨ��
%% rowLimit��Ϊÿ�ζ�ȡ�����ݲ�����������Ĭ��Ϊȫ����ȡ
%% ���ݴ��������������

%TODO����ȡ������1��Class�ع�
function outdata=GetDataFromSqlServer(table,channel,rowLimit)
datasource = 'MatlabTestLink'; %ODBC����Դ���ƣ�win10���� ODBC����Դ��
connA = database(datasource,'sa','jky123!'); %SQL Server���û���������
%279ͨ�����������Ӧ��
connStr=['select MonitorDateTime,Channel,Value from [',table,'] where Channel=''',channel,''' order by MonitorDateTime'];

cursorA=exec(connA,connStr); %���ݿ����ơ�������
%RowLimit = 24*3600*20; 
%��cursA=fetch(cursorA)����������
cursA=fetch(cursorA,rowLimit); % �����ݿ��е����ݶ�ȡ��Matlab�С���fetch
temp=cursA.Data;

%������������ΪԪ����cell���ͣ�Ĭ��ΪCELL�ͣ�Ҫͨ�� cell2mat() ת����ʽ
close(cursorA);
close(connA);


outdata = temp;