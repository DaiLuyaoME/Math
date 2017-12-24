function plotData(Y1,xName,yName,legendName)
%CREATEFIGURE(Y1)
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 24-Dec-2017 19:59:01 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(Y1,'DisplayName',legendName,'Marker','diamond','LineWidth',2);

% ���� xlabel
xlabel(xName,'FontSize',24,'Interpreter','latex');

% ���� ylabel
ylabel(yName,'FontSize',24,'Interpreter','latex');

box(axes1,'on');
% ������������������
set(axes1,'FontSize',16);
% ���� legend
legend1 = legend(axes1,'show');
set(legend1,'FontSize',20);

