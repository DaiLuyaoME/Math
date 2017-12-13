function plotData(Y1,xTitle,yTitle)
%CREATEFIGURE(Y1)
%  Y1:  y 数据的矢量

%  由 MATLAB 于 06-Dec-2017 19:35:29 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
% hold(axes1,'on');

% 创建 plot
semilogy(Y1,'LineWidth',2);
set(axes1,'FontSize',12);
% 创建 xlabel
xlabel(xTitle,'Interpreter','latex','FontSize',16);

% 创建 ylabel
ylabel(yTitle,'Interpreter','latex','FontSize',20);

box(axes1,'on');
% 设置其余坐标轴属性

axis tight;
grid on;