%% ����Ӧ��ԭʼ�����е�0ֵ
%% data��ԭʼ����
%% ��"��λ��"��"���"0ֵ��0ֵ����һ��ʱ���������滻��
%% �����1�����ݾ���0��������ݲ����������ݵľ�ֵ

%TODO����ȡ������1��Class�ع�
function outdata=ProcessZeroData(data)
    if data(1)==0
        data(1)=mean(data);
    end
    zeroIndex=find(data==0);
    %��"��λ��"��"���"0ֵ
    for i=1:size(zeroIndex,1)
        if zeroIndex(i)==1
            continue;
        end
        data(zeroIndex(i))=data(zeroIndex(i)-1);
    end
outdata = data;