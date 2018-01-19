function plotCorrelation(X1, Y1,name)
%CREATEFIGURE(X1, Y1)
%  X1:  x ���ݵ�ʸ��
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 18-Jan-2018 21:22:05 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(X1,Y1,'DisplayName',name,...
    'LineWidth',2);

% ���� xlabel
xlabel('n','Interpreter','latex');

% ���� ylabel
ylabel(name,'Interpreter','latex');

box(axes1,'on');
% ������������������
set(axes1,'FontSize',20);
% ���� legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Interpreter','latex',...
    'FontSize',24);
axis tight;
