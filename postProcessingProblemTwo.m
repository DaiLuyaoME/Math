
%% plot trajectory of xk
% figure;
nameList = {'$l_1$','$l_2$','${{l}_{\infty }}$'};
for i = 1:3
    temp = xCell{i};
    %     subplot(3,1,i);
    figure;
    h = plot(temp(1,:),temp(2,:));
    h.LineWidth = 2;
    h.DisplayName = nameList{i};
    hx = xlabel('$x_1$');
    hy = ylabel('$x_2$');
    hx.Interpreter = 'latex';
    hy.Interpreter = 'latex';
    tempAxes = h.Parent;
    set(tempAxes,'FontSize',18);
    legend show;
    tempAxes.Legend.Interpreter = 'latex';
end
%% plot tendency of objfunc
nameList = {'$l_1$','$l_2$','${{l}_{\infty }}$'};
for i = 1:3
    temp = objFunValueCell{i};
    figure;
    h = plot(temp(1:40));% 画出前40次迭代目标函数值
    h.LineWidth = 2;
    h.DisplayName = nameList{i};
    hx = xlabel('$k$');
    hy = ylabel('$f\left( x \right)$');
    hx.Interpreter = 'latex';
    hy.Interpreter = 'latex';
    tempAxes = h.Parent;
    set(tempAxes,'FontSize',18);
    legend show;
    tempAxes.Legend.Interpreter = 'latex';
end

%%
% figure;
% for i = 1:3
%     temp = descentDirectionCell{i};
%     %     subplot(3,1,i);
%     figure;
%     plot(temp(1,:),temp(2,:));
% end
%%
% tempDe1 = descentDirectionCell{1};
% tempDe2 = descentDirectionCell{2};
% tempDe3 = descentDirectionCell{3};
% %%
% tempX1 = xCell{1};
% tempX2 = xCell{2};
% tempX3 = xCell{3};