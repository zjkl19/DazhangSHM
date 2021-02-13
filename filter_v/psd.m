Fs=48; %采样频率，可用TST5961查看
L=length(data);
nfft=2^nextpow2(L);

w=hamming(L); 

[psdx,f]=pwelch(data,w,nfft/2,nfft,Fs);
xlim([0,3])

[z,p,k]=buttap(n)