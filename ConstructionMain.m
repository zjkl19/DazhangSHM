%建造者模式主函数
%从数据库中提取各个通道应变数据，并在指定目录中保存为Mat
tic;

itemSelect=[0 0 0 1];

SampFreq = 20;     % 采样频率
folderName='DazhangMat';
timeStr='20200610';
strainChannel=["C1802190792","C1802190793","C1802190794","C1802190795"];
accelerateChannel=["CH19-1","CH210-1","CH311-1"];
leanChannel=["CH32-1","CH32-2","CH32-3","CH32-4"];
%大樟   T-1, T-2, T-3, T-4
channel=["CH33-1","CH33-2","CH33-3","CH33-4"];

if  itemSelect(1)==1 
    flag=SaveStrainMat(SampFreq,folderName,timeStr,strainChannel);
end

if  itemSelect(2)==1 
    flag= SaveAccelerateMat(SampFreq,folderName,timeStr,accelerateChannel);
end

if  itemSelect(3)==1 
    flag= SaveLeanMat(SampFreq,folderName,timeStr,leanChannel);
end

if  itemSelect(4)==1 
    flag= SaveTemperatureMat(SampFreq,folderName,timeStr,leanChannel);
end

toc;