function plotData(Y1,xTitle,yTitle)
%CREATEFIGURE(Y1)
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 06-Dec-2017 19:35:29 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(Y1,'MarkerSize',4,'Marker','diamond','LineWidth',2,'LineStyle','--');

% ���� xlabel
xlabel(xTitle,'Interpreter','latex');

% ���� ylabel
ylabel(yTitle,'Interpreter','latex');

box(axes1,'on');
% ������������������
set(axes1,'FontSize',16);
axis tight;
