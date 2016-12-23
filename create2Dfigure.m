function create2Dfigure(X1, Y1, X2, Y2,name)
%CREATEFIGURE(X1, Y1, X2, Y2)
%  X1:  x 数据的矢量
%  Y1:  y 数据的矢量
%  X2:  x 数据的矢量
%  Y2:  y 数据的矢量

%  由 MATLAB 于 23-Dec-2016 19:30:26 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% 创建 plot
plot(X1,Y1,'Parent',axes1,'LineWidth',3,'DisplayName','Before PCA');

% 创建 plot
plot(X2,Y2,'Parent',axes1,'LineWidth',3,'DisplayName','After PCA',...
    'Color',[0 0 0]);

% 创建 xlabel
xlabel('X','FontSize',16,'FontName','Times New Roman');

% 创建 ylabel
ylabel('Y','FontSize',16,'FontName','Times New Roman');
title({name},'FontSize',16,'FontName','Times New Roman');
% 创建 legend
legend(axes1,'show');
grid on;
axis equal;
% axis tight;

