function plotData(Y1,name)
%CREATEFIGURE(Y1)
%  Y1:  y 数据的矢量

%  由 MATLAB 于 19-Jan-2018 20:57:02 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(Y1,'DisplayName',name,'LineWidth',2);

% 创建 xlabel
xlabel('n','FontSize',30,'Interpreter','latex');

% 创建 ylabel
ylabel(name,'FontSize',30,...
    'Interpreter','latex');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',20,'TickLabelInterpreter','latex');
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,'Interpreter','latex','FontSize',30);
axis tight;

