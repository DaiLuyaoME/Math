function comparePlot(X1, Y1, X2, Y2)
%CREATEFIGURE(X1, Y1, X2, Y2)
%  X1:  x ���ݵ�ʸ��
%  Y1:  y ���ݵ�ʸ��
%  X2:  x ���ݵ�ʸ��
%  Y2:  y ���ݵ�ʸ��

%  �� MATLAB �� 24-Dec-2017 20:18:35 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(X1,Y1,'DisplayName','��ʵ״̬','Marker','square','LineWidth',2,...
    'LineStyle','--');

% ���� plot
plot(X2,Y2,'DisplayName','����״̬','Marker','diamond','LineWidth',2);

% ���� xlabel
xlabel('position');

% ���� ylabel
ylabel('velocity');

box(axes1,'on');
% ������������������
set(axes1,'FontSize',20);
% ���� legend
legend(axes1,'show');

