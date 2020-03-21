
%%
%测试1天数据的psd曲线图
SampFreq = 20;     % 采样频率
div=10;
L=length(acc);    %数据长度
nfft=4096;
window=hamming(4096);    
noverlap=length(window)/2;   %分段重叠长度

%pwelch(acc(1:fix(L)) ,window,noverlap,nfft,SampFreq);

[p, f]=pwelch(acc(1:fix(L)) ,window,noverlap,nfft,SampFreq);
plot(f(3:end),p(3:end))
xlabel('频率(Hz)');
ylabel('功率/频率(w/Hz)');
grid;


