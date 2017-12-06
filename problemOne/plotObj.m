function plotObj(Y1)
%CREATEFIGURE(Y1)
%  Y1:  y 数据的矢量

%  由 MATLAB 于 06-Dec-2017 19:35:29 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(Y1,'MarkerSize',10,'Marker','diamond','LineWidth',2,'LineStyle','--');

% 创建 xlabel
xlabel('$k$','Interpreter','latex');

% 创建 ylabel
ylabel('$f\left( {{x}_{k}} \right)$','Interpreter','latex');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',16);
axis tight;
