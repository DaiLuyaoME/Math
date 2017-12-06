function plotXk(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的矢量
%  Y1:  y 数据的矢量

%  由 MATLAB 于 06-Dec-2017 19:32:54 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'MarkerSize',10,'Marker','diamond','LineWidth',2,'LineStyle','--');

% 创建 xlabel
xlabel('${{x}_{k1}}$','Interpreter','latex');

% 创建 ylabel
ylabel('${{x}_{k2}}$','Interpreter','latex');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',16);
