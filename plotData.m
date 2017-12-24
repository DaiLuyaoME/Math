function plotData(Y1,xName,yName,legendName)
%CREATEFIGURE(Y1)
%  Y1:  y 数据的矢量

%  由 MATLAB 于 24-Dec-2017 19:59:01 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(Y1,'DisplayName',legendName,'Marker','diamond','LineWidth',2);

% 创建 xlabel
xlabel(xName,'FontSize',24,'Interpreter','latex');

% 创建 ylabel
ylabel(yName,'FontSize',24,'Interpreter','latex');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',16);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',20);

