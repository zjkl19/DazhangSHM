%---------------------------------------------------------------------低通滤波
f_N=48;                              %采样率  
f_p=1.5; f_s=2; R_p=3; R_s=25;   %设计要求指标 
Ws=f_s/(f_N/2); Wp=f_p/(f_N/2);      %计算归一化角频率 
[n, Wn]=buttord(Wp,Ws,R_p,R_s);      %计算阶数和截止频率 
[b,a]=butter(n, Wn);                   %计算H(z)  
% 绘制结果 
figure(1);  
y=data; 
x=1:1:15105;
subplot(2,2,1);plot(x,y,'.'); title ('输入信号'); 
y1=filter(b,a,y);  
subplot(2,2,2);plot(x,y1,'.'); title('滤波之后的信号'); 