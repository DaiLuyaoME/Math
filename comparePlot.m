function comparePlot(X1, Y1, X2, Y2)
%CREATEFIGURE(X1, Y1, X2, Y2)
%  X1:  x 数据的矢量
%  Y1:  y 数据的矢量
%  X2:  x 数据的矢量
%  Y2:  y 数据的矢量

%  由 MATLAB 于 24-Dec-2017 20:18:35 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'DisplayName','真实状态','Marker','square','LineWidth',2,...
    'LineStyle','--');

% 创建 plot
plot(X2,Y2,'DisplayName','估计状态','Marker','diamond','LineWidth',2);

% 创建 xlabel
xlabel('position');

% 创建 ylabel
ylabel('velocity');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',20);
% 创建 legend
legend(axes1,'show');

