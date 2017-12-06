function plotXk(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  x ���ݵ�ʸ��
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 06-Dec-2017 19:32:54 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(X1,Y1,'MarkerSize',10,'Marker','diamond','LineWidth',2,'LineStyle','--');

% ���� xlabel
xlabel('${{x}_{k1}}$','Interpreter','latex');

% ���� ylabel
ylabel('${{x}_{k2}}$','Interpreter','latex');

box(axes1,'on');
% ������������������
set(axes1,'FontSize',16);
