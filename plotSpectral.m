function plotCorrelation(X1, Y1,name)
%CREATEFIGURE(X1, Y1)
%  X1:  x 数据的矢量
%  Y1:  y 数据的矢量

%  由 MATLAB 于 18-Jan-2018 21:22:05 自动生成

% 创建 figure
figure1 = figure;

% 创建 axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% 创建 plot
plot(X1,Y1,'DisplayName',name,...
    'LineWidth',2);

% 创建 xlabel
xlabel('Normalized Frequency  (\times2\pi rad/sample)');

% 创建 ylabel
ylabel('Magnitude (dB)');

box(axes1,'on');
% 设置其余坐标轴属性
set(axes1,'FontSize',16);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Interpreter','latex',...
    'FontSize',20);
axis tight;

