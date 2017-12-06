
%%
nameList = {'$l_1$','$l_2$','${{l}_{\infty }}$'};
for i = 1:3
    value = objValueCell{i};
    optimalValue = value(end);
    disp('optimal value is ');
    disp(optimalValue);
    logError = log( value(1:end-1) - optimalValue );
    figure;
    if ( i == 1)
        h =  plot(logError);
    else
        h = plot(logError,'MarkerSize',8,'Marker','o','LineStyle','--');
    end
    h.LineWidth = 2;
    h.DisplayName = nameList{i};
    hx = xlabel('$k$');
    hy = ylabel('$\log \left( f\left( {{x}^{k}} \right)-{{p}^{*}} \right)$');
    hx.Interpreter = 'latex';
    hy.Interpreter = 'latex';
    tempAxes = h.Parent;
    set(tempAxes,'FontSize',16);
    legend show;
    tempAxes.Legend.Interpreter = 'latex';
    axis tight;
    %     grid on;
end
%%
nameList = {'$l_1$','$l_2$','${{l}_{\infty }}$'};
for i = 1:3
    figure;
    if ( i == 1)
        h =  plot(tCell{i});
    else
        h = plot(tCell{i},'MarkerSize',8,'Marker','o','LineStyle','--');
    end
    h.LineWidth = 2;
    h.DisplayName = nameList{i};
    hx = xlabel('$k$');
    hy = ylabel('${{t}^{k}}$');
    hx.Interpreter = 'latex';
    hy.Interpreter = 'latex';
    tempAxes = h.Parent;
    set(tempAxes,'FontSize',16);
    legend show;
    tempAxes.Legend.Interpreter = 'latex';
    axis tight;
    %     grid on;
end
%%
tempx1 = xCell{1};
tempx2 = xCell{2};
tempx3 = xCell{3};
%%