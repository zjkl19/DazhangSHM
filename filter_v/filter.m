%---------------------------------------------------���ϲο�����
T=0.1; FS=1/T;  
fp=0.2*pi;fs=0.3*pi; 
wp=fp/FS*2*pi; ws=fs/FS*2*pi; 
Rp = 1; % ͨ��˥�� 
As = 15; % ���˥��  
OmegaP = (2/T)*tan(wp/2); % Ƶ��Ԥ�� 
OmegaS = (2/T)*tan(ws/2);   % Ƶ��Ԥ��
%��ư�����˹��ͨ�˲���ԭ��

N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(OmegaP/OmegaS))); 
OmegaC = OmegaP/((10^(Rp/10)-1)^(1/(2*N))); 
[z,p,k] = buttap(N); %��ȡ�㼫����� 
p = p * OmegaC  
k = k*OmegaC^N; 
B = real(poly(z)); 
b0 = k;  
cs = k*B;  ds = real(poly(p));  
[b,a] = bilinear(cs,ds,FS);% ˫���Ա任

figure(1);% ���ƽ��  
freqz(b,a,512,FS);%�����˲���֤ 

figure(2);  % ���ƽ�� 
f1=50; f2=250; n=0:63;  
x=sin(2*pi*f1*n)+sin(2*pi*f2*n); 
subplot(2,2,1);stem(x,'.'); title ('�����ź�'); 
y=filter(b,a,x);  
subplot(2,2,2);stem(y,'.'); title('�˲�֮����ź�');  

figure(3);    
stem(y,'.'); title('������ź�')

%---------------------------------------------------�޸�
T=1/48; FS=1/T;  
fp=0.05;fs=0.1; 
wp=fp*2*pi; ws=fs*2*pi; 
Rp = 3; % ͨ��˥�� 
As = 30; % ���˥��  
OmegaP = (2/T)*tan(wp/2); % Ƶ��Ԥ�� 
OmegaS = (2/T)*tan(ws/2);   % Ƶ��Ԥ��
%��ư�����˹��ͨ�˲���ԭ��

N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(OmegaP/OmegaS))); 
OmegaC = OmegaP/((10^(Rp/10)-1)^(1/(2*N))); 
[z,p,k] = buttap(N); %��ȡ�㼫����� 
p = p * OmegaC  
k = k*OmegaC^N; 
B = real(poly(z)); 
b0 = k;  
cs = k*B;  ds = real(poly(p));  
[b,a] = bilinear(cs,ds,FS);% ˫���Ա任

figure(1);% ���ƽ��  
freqz(b,a,512,FS);%�����˲���֤ 

figure(2);  % ���ƽ�� 
y=data; 
x=1:1:15105;
subplot(2,2,1);plot(x,y,'.'); title ('�����ź�'); 
y1=filter(b,a,y);  
subplot(2,2,2);plot(x,y1,'.'); title('�˲�֮����ź�');  

figure(3);    
plot(x,y1,'.'); title('������ź�')

