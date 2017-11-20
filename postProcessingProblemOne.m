%% post processing of back tracking line search
% plot of object function value
figure;
h = plot(0:9,objValueListBackSearch(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '目标函数值';
h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [0,9];
title('back tracking search');
xlabel('迭代次数');
ylabel('$f\left( x \right)$');
axes.YLabel.Interpreter = 'latex';
legend show;
grid on;

% plot of delta object function value
figure;
temp = abs(diff(objValueListBackSearch));
h = plot(1:10,temp(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '$|\Delta f\left( {{x}_{k}} \right)|$';
h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [1,10];
title('back tracking search');
xlabel('迭代次数');
ylabel('$|f\left( {{x}_{k}} \right)-f\left( {{x}_{k-1}} \right)|$');
axes.YLabel.Interpreter = 'latex';
legend show;
axes.Legend.Interpreter = 'latex';
grid on;

% plot of solution
figure;
h = plot(0:9,xListBackSearch(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '$x_k$';

h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [0,9];
title('back tracking search');
xlabel('迭代次数');
ylabel('$x_k$');
axes.YLabel.Interpreter = 'latex';
legend show;
axes.Legend.Interpreter = 'latex';
grid on;

% plot of delta solution
figure;
temp = abs(diff(xListBackSearch));
h = plot(1:10,temp(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '$\left| \Delta {{x}_{k}} \right|$';

h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [1,10];
title('back tracking search');
xlabel('迭代次数');
ylabel('$\left| {{x}_{k}}-{{x}_{k-1}} \right|$');
axes.YLabel.Interpreter = 'latex';
legend show;
axes.Legend.Interpreter = 'latex';
grid on;





%% post processing of exact line search
% plot of object function value
figure;
h = plot(0:9,objValueListExactSearch(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '目标函数值';
h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [0,9];
title('exact line search');
xlabel('迭代次数');
ylabel('$f\left( x \right)$');
axes.YLabel.Interpreter = 'latex';
legend show;
grid on;

% plot of delta object function value
figure;
temp = abs(diff(objValueListExactSearch));
h = plot(1:10,temp(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '$|\Delta f\left( {{x}_{k}} \right)|$';
h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [1,10];
title('exact line search');
xlabel('迭代次数');
ylabel('$|f\left( {{x}_{k}} \right)-f\left( {{x}_{k-1}} \right)|$');
axes.YLabel.Interpreter = 'latex';
legend show;
axes.Legend.Interpreter = 'latex';
grid on;

% plot of solution
figure;
h = plot(0:9,xListExactSearch(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '$x_k$';

h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [0,9];
title('exact line search');
xlabel('迭代次数');
ylabel('$x_k$');
axes.YLabel.Interpreter = 'latex';
legend show;
axes.Legend.Interpreter = 'latex';
grid on;

% plot of delta solution
figure;
temp = abs(diff(xListExactSearch));
h = plot(1:10,temp(1:10),'diamond','MarkerIndices',1:5);
h.LineWidth = 2;
h.LineStyle = '--';
% h.Marker = 'diamond';
h.DisplayName = '$\left| \Delta {{x}_{k}} \right|$';

h.MarkerSize = 10;
axes = h.Parent;
axes.FontSize = 18;
axes.XLim = [1,10];
title('exact line search');
xlabel('迭代次数');
ylabel('$\left| {{x}_{k}}-{{x}_{k-1}} \right|$');
axes.YLabel.Interpreter = 'latex';
legend show;
axes.Legend.Interpreter = 'latex';
grid on;



