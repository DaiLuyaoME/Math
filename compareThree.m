function compareThree(YMatrix1,yName)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  y 数据的矩阵

%  由 MATLAB 于 24-Dec-2017 21:18:44 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 使用 plot 的矩阵输入创建多行
plot1 = plot(YMatrix1,'LineWidth',2,'Parent',axes1);
set(plot1(1),'DisplayName','卡尔曼滤波','Marker','o');
set(plot1(2),'DisplayName','测量系统','Marker','pentagram');
set(plot1(3),'DisplayName','动力学方程预测','Marker','diamond');

% 创建 xlabel
xlabel('$n$','Interpreter','latex');

% 创建 ylabel
ylabel(yName);

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',20);
% 创建 legend
legend(axes1,'show');

