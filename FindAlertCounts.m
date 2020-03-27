
%应变
%每1行的含义：[黄色预警下界 黄色预警上界 红色预警下界 红色预警上界]
value=lean;    %复制变量
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