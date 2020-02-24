
%%
%测试1天数据的psd曲线图

%TODO：读取数据用1个Class重构
datasource = 'MatlabTestLink'; %前面设置的数据源名称
connA = database(datasource,'sa','jky123!'); %SQL Server的用户名和密码
%272通道：主跨跨中加速度
cursorA=exec(connA,'select MonitorDateTime,Channel,Value from D1108 where Channel=272'); %数据库名称、表名称
RowLimit = 24*3600*20; % RowLimit为每次读取的数据参数的行数，默认为全部读取
%用cursA=fetch(cursorA)不限制数量
cursA=fetch(cursorA,RowLimit); % 把数据库中的数据读取到Matlab中——fetch
 
%返回数据类型为元包（cell）型，默认为CELL型，要通过 cell2mat() 转换格式
DataA=cursA.Data; %把读取到的数据用变量Data保存.
 
%关闭连接
close(cursorA);
close(connA);


ValueColIndex=3;   %值所在列索引

SampFreq = 20;     % 采样频率
data=cell2mat(cursA.Data(:,ValueColIndex));

% L=length(data);    %数据长度
% nfft=2^nextpow2(L);
% window=hamming(nfft/10);    %分10段
% noverlap=length(window)/2;   %分段重叠长度

%%
% 每5min识别一次频率，每次数据长1h

fLbound=3.87*0.9;fUbound=3.87*1.1;

tSpan = SampFreq*60*60;   %计算时长
tInterval = SampFreq*60*30;   %每次识别间隔30min（单位：s）

for i = 1:length(data)/tInterval
    startTime = (i-1)*tInterval+1;              %识别开始结点
    endTime =min(startTime+tSpan-1,L);   %识别结束结点
    
    dataToAnalyze = data(startTime:endTime,1);
    L=length(dataToAnalyze);
    nfft=2^nextpow2(L);
    window=hamming(nfft/10);    %分10段
    noverlap=length(window)/2;   %分段重叠长度
    
    [p,f] = pwelch(dataToAnalyze ,window,noverlap,nfft,SampFreq);
    [power,index] = max(p(fLbound/0.002:fUbound/0.002));          %1.97Hz上下浮动10%范围
    FirstFreq(i) = f(index+fLbound/0.002-1);
end

figure(1)
boxplot(FirstFreq)

%pwelch(data,window,noverlap,nfft,SampFreq);

