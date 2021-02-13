%---------------------------------------------------网上参考程序
T=0.1; FS=1/T;  
fp=0.2*pi;fs=0.3*pi; 
wp=fp/FS*2*pi; ws=fs/FS*2*pi; 
Rp = 1; % 通带衰减 
As = 15; % 阻带衰减  
OmegaP = (2/T)*tan(wp/2); % 频率预计 
OmegaS = (2/T)*tan(ws/2);   % 频率预计
%设计巴特沃斯低通滤波器原型

N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(OmegaP/OmegaS))); 
OmegaC = OmegaP/((10^(Rp/10)-1)^(1/(2*N))); 
[z,p,k] = buttap(N); %获取零极点参数 
p = p * OmegaC  
k = k*OmegaC^N; 
B = real(poly(z)); 
b0 = k;  
cs = k*B;  ds = real(poly(p));  
[b,a] = bilinear(cs,ds,FS);% 双线性变换

figure(1);% 绘制结果  
freqz(b,a,512,FS);%进行滤波验证 

figure(2);  % 绘制结果 
f1=50; f2=250; n=0:63;  
x=sin(2*pi*f1*n)+sin(2*pi*f2*n); 
subplot(2,2,1);stem(x,'.'); title ('输入信号'); 
y=filter(b,a,x);  
subplot(2,2,2);stem(y,'.'); title('滤波之后的信号');  

figure(3);    
stem(y,'.'); title('输出的信号')

%---------------------------------------------------修改
T=1/48; FS=1/T;  
fp=0.05;fs=0.1; 
wp=fp*2*pi; ws=fs*2*pi; 
Rp = 3; % 通带衰减 
As = 30; % 阻带衰减  
OmegaP = (2/T)*tan(wp/2); % 频率预计 
OmegaS = (2/T)*tan(ws/2);   % 频率预计
%设计巴特沃斯低通滤波器原型

N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(OmegaP/OmegaS))); 
OmegaC = OmegaP/((10^(Rp/10)-1)^(1/(2*N))); 
[z,p,k] = buttap(N); %获取零极点参数 
p = p * OmegaC  
k = k*OmegaC^N; 
B = real(poly(z)); 
b0 = k;  
cs = k*B;  ds = real(poly(p));  
[b,a] = bilinear(cs,ds,FS);% 双线性变换

figure(1);% 绘制结果  
freqz(b,a,512,FS);%进行滤波验证 

figure(2);  % 绘制结果 
y=data; 
x=1:1:15105;
subplot(2,2,1);plot(x,y,'.'); title ('输入信号'); 
y1=filter(b,a,y);  
subplot(2,2,2);plot(x,y1,'.'); title('滤波之后的信号');  

figure(3);    
plot(x,y1,'.'); title('输出的信号')

