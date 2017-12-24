function plotAllData(X1, Y1, X2, Y2, X3, Y3, X4, Y4)
%CREATEFIGURE(X1, Y1, X2, Y2, X3, Y3, X4, Y4)
%  X1:  x 数据的矢量
%  Y1:  y 数据的矢量
%  X2:  x 数据的矢量
%  Y2:  y 数据的矢量
%  X3:  x 数据的矢量
%  Y3:  y 数据的矢量
%  X4:  x 数据的矢量
%  Y4:  y 数据的矢量

%  由 MATLAB 于 24-Dec-2017 21:13:30 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'DisplayName','真实状态','Marker','o','LineWidth',2);

% 创建 plot
plot(X2,Y2,'DisplayName','卡尔曼滤波','Marker','square','LineWidth',2);

% 创建 plot
plot(X3,Y3,'DisplayName','测量系统','Marker','pentagram','LineWidth',2);

% 创建 plot
plot(X4,Y4,'DisplayName','动力学方程预测','Marker','diamond','LineWidth',2);

% 创建 xlabel
xlabel('position');

% 创建 ylabel
ylabel('velocity');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',20);
% 创建 legend
legend(axes1,'show');

