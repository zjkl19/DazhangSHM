datasource = 'MatlabTestLink'; %前面设置的数据源名称
 
connA = database(datasource,'sa','jky123!'); %SQL Server的用户名和密码
 
cursorA=exec(connA,'select MonitorDateTime,Channel,Value from D1108 where Channel=272'); %数据库名称、表名称
 
RowLimit = 24*3600*20; % RowLimit为每次读取的数据参数的行数，默认为全部读取
 
cursA=fetch(cursorA,RowLimit); % 把数据库中的数据读取到Matlab中——fetch
 
%返回数据类型为元包（cell）型，默认为CELL型，要通过 cell2mat() 转换格式
 
DataA=cursA.Data; %把读取到的数据用变量Data保存.
 
%关闭连接
close(cursorA);
 
close(connA);