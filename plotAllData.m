function plotAllData(X1, Y1, X2, Y2, X3, Y3, X4, Y4)
%CREATEFIGURE(X1, Y1, X2, Y2, X3, Y3, X4, Y4)
%  X1:  x ���ݵ�ʸ��
%  Y1:  y ���ݵ�ʸ��
%  X2:  x ���ݵ�ʸ��
%  Y2:  y ���ݵ�ʸ��
%  X3:  x ���ݵ�ʸ��
%  Y3:  y ���ݵ�ʸ��
%  X4:  x ���ݵ�ʸ��
%  Y4:  y ���ݵ�ʸ��

%  �� MATLAB �� 24-Dec-2017 21:13:30 �Զ�����

% ���� figure
figure1 = figure;

% ���� axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% ���� plot
plot(X1,Y1,'DisplayName','��ʵ״̬','Marker','o','LineWidth',2);

% ���� plot
plot(X2,Y2,'DisplayName','�������˲�','Marker','square','LineWidth',2);

% ���� plot
plot(X3,Y3,'DisplayName','����ϵͳ','Marker','pentagram','LineWidth',2);

% ���� plot
plot(X4,Y4,'DisplayName','����ѧ����Ԥ��','Marker','diamond','LineWidth',2);

% ���� xlabel
xlabel('position');

% ���� ylabel
ylabel('velocity');

box(axes1,'on');
% ������������������
set(axes1,'FontSize',20);
% ���� legend
legend(axes1,'show');

