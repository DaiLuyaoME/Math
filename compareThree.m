function compareThree(YMatrix1,yName)
%CREATEFIGURE(YMATRIX1)
%  YMATRIX1:  y ���ݵľ���

%  �� MATLAB �� 24-Dec-2017 21:18:44 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ʹ�� plot �ľ������봴������
plot1 = plot(YMatrix1,'LineWidth',2,'Parent',axes1);
set(plot1(1),'DisplayName','�������˲�','Marker','o');
set(plot1(2),'DisplayName','����ϵͳ','Marker','pentagram');
set(plot1(3),'DisplayName','����ѧ����Ԥ��','Marker','diamond');

% ���� xlabel
xlabel('$n$','Interpreter','latex');

% ���� ylabel
ylabel(yName);

box(axes1,'on');
% ������������������
set(axes1,'FontSize',20);
% ���� legend
legend(axes1,'show');

