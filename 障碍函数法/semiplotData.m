function plotData(Y1,xTitle,yTitle)
%CREATEFIGURE(Y1)
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 06-Dec-2017 19:35:29 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
% hold(axes1,'on');

% ���� plot
semilogy(Y1,'LineWidth',2);
set(axes1,'FontSize',12);
% ���� xlabel
xlabel(xTitle,'Interpreter','latex','FontSize',16);

% ���� ylabel
ylabel(yTitle,'Interpreter','latex','FontSize',20);

box(axes1,'on');
% ������������������

axis tight;
grid on;