function create2Dfigure(X1, Y1, X2, Y2,name)
%CREATEFIGURE(X1, Y1, X2, Y2)
%  X1:  x ���ݵ�ʸ��
%  Y1:  y ���ݵ�ʸ��
%  X2:  x ���ݵ�ʸ��
%  Y2:  y ���ݵ�ʸ��

%  �� MATLAB �� 23-Dec-2016 19:30:26 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% ���� plot
plot(X1,Y1,'Parent',axes1,'LineWidth',3,'DisplayName','Before PCA');

% ���� plot
plot(X2,Y2,'Parent',axes1,'LineWidth',3,'DisplayName','After PCA',...
    'Color',[0 0 0]);

% ���� xlabel
xlabel('X','FontSize',16,'FontName','Times New Roman');

% ���� ylabel
ylabel('Y','FontSize',16,'FontName','Times New Roman');
title({name},'FontSize',16,'FontName','Times New Roman');
% ���� legend
legend(axes1,'show');
grid on;
axis equal;
% axis tight;

