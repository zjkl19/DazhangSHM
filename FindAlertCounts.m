
%Ӧ��
%ÿ1�еĺ��壺[��ɫԤ���½� ��ɫԤ���Ͻ� ��ɫԤ���½� ��ɫԤ���Ͻ�]
value=lean;    %���Ʊ���
largeNumber=9999;
% AlertArray= [-1*largeNumber 89 -1*(largeNumber+1) 156;
%      -1*largeNumber 75 -1*(largeNumber+1) 151;
%      -1*largeNumber 75 -1*(largeNumber+1) 151;
%      -1*largeNumber 89 -1*(largeNumber+1) 156;
%      ];
 
 AlertArray= [-1*0.1 0.1 -1*0.15 15;
     -1*0.1 0.1 -1*0.15 15;
     -1*0.1 0.1 -1*0.15 15;
      -1*0.1 0.1 -1*0.15 15;
     ];
 
 disp('yellow alert:');
 for i=1:size(AlertArray,1)
     positiveIndex=find(value(:,i)>=AlertArray(i,2) & value(:,i)<AlertArray(i,4));
     negativeIndex=find(value(:,i)<=AlertArray(i,1) & value(:,i)>AlertArray(i,3));
     disp(num2str(length(positiveIndex)+length(negativeIndex)));
 end
 
  disp('red alert:');
  for i=1:size(AlertArray,1)
     positiveIndex=find(value(:,i)>=AlertArray(i,4));
     negativeIndex=find(value(:,i)<=AlertArray(i,3));
     disp(num2str(length(positiveIndex)+length(negativeIndex)));
 end

%index=find(strain>120);
%disp(['red alert:' length(index)]);