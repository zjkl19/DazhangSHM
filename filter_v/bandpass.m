%----------------------------------------------带通滤波，调用hua_fft函数
fs=48;
%ff1=100;
%ff2=400;
%ff3=700;
t=1:1:15105;
x=data;
figure;
subplot(211);plot(t,x);
subplot(212);hua_fft(x,fs,1);
% y=filter(bz1,az1,x);
y=bandp(x,0.9,1.1,0.8,1.2,3,30,fs);
figure;
subplot(211);plot(t,y);