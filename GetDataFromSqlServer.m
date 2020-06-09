%% 从Sql Server中读取使用于处理的数据，1次读取1个通道的数据
%% 返回数据类型为元包（cell）型，默认为CELL型，要通过 cell2mat() 转换格式
%% 注意：原始数据时间为格林尼治时间
%% table：表名
%% channel：通道
%% rowLimit：为每次读取的数据参数的行数，默认为全部读取
%% 数据从中锐服务器导出

%TODO：读取数据用1个Class重构
function outdata=GetDataFromSqlServer(table,channel,rowLimit)
datasource = 'MatlabTestLink'; %ODBC数据源名称（win10搜索 ODBC数据源）
connA = database(datasource,'sa','jky123!'); %SQL Server的用户名和密码
%279通道：主跨跨中应变
connStr=['select MonitorDateTime,Channel,Value from [',table,'] where Channel=''',channel,''' order by MonitorDateTime'];

cursorA=exec(connA,connStr); %数据库名称、表名称
%RowLimit = 24*3600*20; 
%用cursA=fetch(cursorA)不限制数量
cursA=fetch(cursorA,rowLimit); % 把数据库中的数据读取到Matlab中——fetch
temp=cursA.Data;

%返回数据类型为元包（cell）型，默认为CELL型，要通过 cell2mat() 转换格式
close(cursorA);
close(connA);


outdata = temp;