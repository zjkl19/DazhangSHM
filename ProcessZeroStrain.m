%% 处理应变原始数据中的0值
%% data：原始数据
%% 用"移位法"逐步"填充"0值（0值用上一个时间点的数据替换）
%% 如果第1个数据就是0，则该数据采用整体数据的均值

%TODO：读取数据用1个Class重构
function outdata=ProcessZeroStrain(data)
    zeroIndex=find(data==0);
    if data(1)==0
        data(1)=mean(data);
    end
    %用"移位法"逐步"填充"0值
    for i=1:size(zeroIndex,1)
        data(zeroIndex(i))=data(zeroIndex(i)-1);
    end
outdata = data;