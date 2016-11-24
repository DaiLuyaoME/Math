function createfigure(X1,Y1,titleName,legendName)
%CREATEFIGURE(Y1)
%  Y1:  y ���ݵ�ʸ��

%  �� MATLAB �� 25-Nov-2016 01:35:20 �Զ�����

% ���� figure
figure1 = figure('PaperSize',[20 29]);

% ���� axes
axes1 = axes('Parent',figure1,'FontSize',20,'FontName','Times New Roman');
box(axes1,'on');
hold(axes1,'all');

% ���� title
title(titleName,'FontSize',20,'FontName','Times New Roman');

% ���� plot
plot(X1,Y1,'Parent',axes1,'MarkerFaceColor',[0 0 1],'Marker','o','LineWidth',3,...
    'LineStyle',':',...
    'Color',[0 0 1]);

% ���� legend
legend(axes1,legendName);

