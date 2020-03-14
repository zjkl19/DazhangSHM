%% 绘制应变时程曲线
%% 要提前算好strain变量，每1列表示每个通道的数据

plot([1:1727166],strain(1:1727166,1),'DisplayName','strain')
for i=1:10
    text(fix(1727166*i/10),strain(fix(1727166*i/10),1),xtime{1}{fix(1727166*i/10),1})
end
%set(gca,'xticklabel',mat2cell([1:1727166]));
xlim(gca,[1,1727166]);
xlabel('时间')
ylabel('应变(με)')