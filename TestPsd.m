
%%
%����1�����ݵ�psd����ͼ
SampFreq = 20;     % ����Ƶ��
div=10;
L=length(acc);    %���ݳ���
nfft=4096;
window=hamming(4096);    
noverlap=length(window)/2;   %�ֶ��ص�����

%pwelch(acc(1:fix(L)) ,window,noverlap,nfft,SampFreq);

[p, f]=pwelch(acc(1:fix(L)) ,window,noverlap,nfft,SampFreq);
plot(f(3:end),p(3:end))
xlabel('Ƶ��(Hz)');
ylabel('����/Ƶ��(w/Hz)');
grid;


