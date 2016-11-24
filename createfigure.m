function createfigure(X1,Y1,titleName,legendName)
%CREATEFIGURE(Y1)
%  Y1:  y 数据的矢量

%  由 MATLAB 于 25-Nov-2016 01:35:20 自动生成

% 创建 figure
figure1 = figure('PaperSize',[20 29]);

% 创建 axes
axes1 = axes('Parent',figure1,'FontSize',20,'FontName','Times New Roman');
box(axes1,'on');
hold(axes1,'all');

% 创建 title
title(titleName,'FontSize',20,'FontName','Times New Roman');

% 创建 plot
plot(X1,Y1,'Parent',axes1,'MarkerFaceColor',[0 0 1],'Marker','o','LineWidth',3,...
    'LineStyle',':',...
    'Color',[0 0 1]);

% 创建 legend
legend(axes1,legendName);

