function plotData(Y1,name)
%CREATEFIGURE(Y1)
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 19-Jan-2018 20:57:02 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(Y1,'DisplayName',name,'LineWidth',2);

% ���� xlabel
xlabel('n','FontSize',30,'Interpreter','latex');

% ���� ylabel
ylabel(name,'FontSize',30,...
    'Interpreter','latex');

box(axes1,'on');
% ������������������
set(axes1,'FontSize',20,'TickLabelInterpreter','latex');
% ���� legend
legend1 = legend(axes1,'show');
set(legend1,'Interpreter','latex','FontSize',30);
axis tight;

