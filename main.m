%% generate data
matrixGenerator;

%%
% for table 2.3.3
%diagMatNum=5;
methodNum=5;
maxIter=30;
absoluteRes=zeros(methodNum,diagMatNum);
resvecCell=cell(methodNum,diagMatNum);
for i=1:diagMatNum
    for j=1:methodNum
        [x,relres,iter,resvec]=solution(A{i,1},b{i,1},j,1e-12,maxIter);
        absoluteRes(j,i)=relres*norm(b{i,1});
        resvecCell{j,i}=resvec;
    end
end
%% plot final absolute residual
algorithmName={'CG','Lanczos','MINRES','GS CG','SOR-pre CG'};
close all;
figure1=figure('PaperSize',[80 60]);
for j=1:methodNum
    subploti=subplot(1,methodNum,j,'Parent',figure1,'FontSize',15,'FontName','Times New Roman');
    
    plot(absoluteRes(j,:),'Parent',subploti,'MarkerFaceColor',[0 0 1],'Marker','o','LineWidth',3,...
        'LineStyle',':',...
        'Color',[0 0 1]);
    title(algorithmName{j},'FontSize',15,'FontName','Times New Roman');
    %     title('Circular Lanczos with period=10','FontSize',15,'FontName','Times New Roman');
    xlabel('{D}_{i}','FontSize',20);
    xlim([1,5]);
    ylabel('绝对误差','FontSize',20);
    legend('{e}_{30}');
    % hold on;
end
%% plot residual tendency
close all;
algorithmName={'CG','Lanczos','MINRES','G-S CG','SOR-pre CG'};
color={'y','m','c','r','k','g'};
marker={'o','+','*','s','d'};
leg={'{D}_{1}','{D}_{2}','{D}_{3}','{D}_{4}','{D}_{5}'};
for i=1:methodNum
    tempfig=figure('PaperType','<custom>','PaperSize',[160,120]);
    axes1 = axes('Parent',tempfig,'FontSize',20,'FontName','Times New Roman');
    box(axes1,'on');
    hold(axes1,'all');
    title(algorithmName{i},'FontSize',15,'FontName','Times New Roman');
    for j=1:diagMatNum
        plot(resvecCell{i,j},'Parent',axes1,'Color',color{j},'LineWidth',3,'Marker',marker{j},'MarkerSize',10);
        hold on;
    end
    xlabel('迭代次数','FontSize',20);
    ylabel('绝对误差','FontSize',20);
    legend(leg);
    ylim([0,1e4]);
    xlim([0,maxIter]);
    % xlim([0,40]);
    
    title(algorithmName{i},'FontSize',15,'FontName','Times New Roman');
end

%% plot e(n)/e(n-1)
close all;
algorithmName={'CG','Lanczos','MINRES','G-S CG','SOR-pre CG'};
color={'y','m','c','r','k','g'};
marker={'o','+','*','s','d'};
leg={'{D}_{1}','{D}_{2}','{D}_{3}','{D}_{4}','{D}_{5}'};
for i=1:methodNum
    tempfig=figure('PaperType','<custom>','PaperSize',[160,120]);
    axes1 = axes('Parent',tempfig,'FontSize',20,'FontName','Times New Roman');
    box(axes1,'on');
    hold(axes1,'all');
    title(algorithmName{i},'FontSize',15,'FontName','Times New Roman');
    for j=1:diagMatNum
        temp=resvecCell{i,j};
        temp=temp(2:end)./temp(1: (numel(temp)-1));
        plot(temp,'Parent',axes1,'Color',color{j},'LineWidth',3,'Marker',marker{j},'MarkerSize',10);
        hold on;
    end
    xlabel('迭代次数','FontSize',20);
    ylabel('$\left\| \frac{{{e}_{n+1}}}{{{e}_{n}}} \right\|$','Interpreter','latex','FontSize',30);
    legend(leg);
    ylim([0,1.6]);
    %     xlim([0,1]);
    %     title('$\frac{{{e}_{n+1}}}{{{e}_{n}}}$','FontSize',15,'FontName','Times New Roman');
    %         title(algorithmName{i},'FontSize',15,'FontName','Times New Roman');
end


%% analysis the eigen value distribution
close all;
if (isPosDef==1)
    Y=zeros(11,5);
    for i=1:5
        [nelements,centers]=hist(diagEle{i},[0:10:100]);
        x=centers;
        Y(:,i)=nelements;
    end
else
    Y=zeros(21,5);
    for i=1:5
        [nelements,centers]=hist(diagEle{i},[-100:10:100]);
        x=centers;
        Y(:,i)=nelements;
    end
end
bar3(x,Y);
% bar3(centers1,nelements1,centers2,nelements2);
% 创建 xlabel
xlabel('序号','FontWeight','bold','FontSize',14);

% 创建 ylabel
ylabel('特征值区间','FontWeight','bold','FontSize',14);

% 创建 zlabel
zlabel('特征值数量','FontWeight','bold','FontSize',14);

%% plot circular Lanczos
close all;
figure1=figure('PaperSize',[80 60]);
axes1 = axes('Parent',figure1,'FontSize',15,'FontName','Times New Roman');
box(axes1,'on');
hold(axes1,'all');
plot(absoluteRes(2,:),'Parent',axes1,'MarkerFaceColor',[0 0 1],'Marker','o','LineWidth',3,...
    'LineStyle',':',...
    'Color',[0 0 1]);
title('Non-Circular Lanczos','FontSize',15,'FontName','Times New Roman');
xlabel('{D}_{i}','FontSize',20);
xlim([1,5]);
ylabel('绝对误差','FontSize',20);
legend('{e}_{40}');
uimenufcn(gcf,'EditCopyFigure');
% hold on;


%% for table 2.3.4
cg=1;
lanczos=2;
minres=3;
res=cell(3,QMatNum);
% rescg=zeros(1,ANum);
% reslan=zeros(1,ANum);
% minres=zeros(1,ANum);
maxIter=80;
i=1;
for j=1:QMatNum
    for k=1:3
        [x,relres,iter,resvec]=solution(A{i,j},b{i,j},k,1e-12,maxIter);
        res{k,j}=resvec;
    end
end

%%
%% plot residual tendency
close all;
algorithmName={'CG','Lanczos','MINRES'};
color={'y','m','c','r','k','g','b','y','m','c'};
marker={'o','+','*','s','d','.','x','p','h','^'};
leg={'{Q}_{1}','{Q}_{2}','{Q}_{3}','{Q}_{4}','{Q}_{5}','{Q}_{6}','{Q}_{7}','{Q}_{8}','{Q}_{9}','{Q}_{10}'};
for k=1:3
    tempfig=figure('PaperType','<custom>','PaperSize',[160,120]);
    axes1 = axes('Parent',tempfig,'FontSize',20,'FontName','Times New Roman');
    box(axes1,'on');
    hold(axes1,'all');
    title(algorithmName{k},'FontSize',15,'FontName','Times New Roman');
    for j=1:QMatNum
        plot(res{k,j},'Parent',axes1,'Color',color{j},'LineWidth',3,'Marker',marker{j},'MarkerSize',10);
        hold on;
    end
    xlabel('迭代次数','FontSize',20);
    ylabel('绝对误差','FontSize',20);
    legend(leg);
%     ylim([0,1e4]);
    xlim([0,maxIter]);
%     xlim([0,20]);
    
    title(algorithmName{k},'FontSize',15,'FontName','Times New Roman');
end

%% plot e(n)/e(n-1)
close all;
algorithmName={'CG','Lanczos','MINRES'};
color={'y','m','c','r','k','g','b','y','m','c'};
marker={'o','+','*','s','d','.','x','p','h','^'};
leg={'{Q}_{1}','{Q}_{2}','{Q}_{3}','{Q}_{4}','{Q}_{5}','{Q}_{6}','{Q}_{7}','{Q}_{8}','{Q}_{9}','{Q}_{10}'};
for k=1:3
    tempfig=figure('PaperType','<custom>','PaperSize',[160,120]);
    axes1 = axes('Parent',tempfig,'FontSize',20,'FontName','Times New Roman');
    box(axes1,'on');
    hold(axes1,'all');
    title(algorithmName{k},'FontSize',15,'FontName','Times New Roman');
    for j=1:QMatNum
        temp=res{k,j};
        temp=temp(2:end)./temp(1: (numel(temp)-1));
        plot(temp,'Parent',axes1,'Color',color{j},'LineWidth',3,'Marker',marker{j},'MarkerSize',10);
        hold on;
    end
    xlabel('迭代次数','FontSize',20);
    ylabel('$\left\| \frac{{{e}_{n+1}}}{{{e}_{n}}} \right\|$','Interpreter','latex','FontSize',30);
    legend(leg);
%     ylim([0,1.6]);
    %     xlim([0,1]);
    %     title('$\frac{{{e}_{n+1}}}{{{e}_{n}}}$','FontSize',15,'FontName','Times New Roman');
    %         title(algorithmName{i},'FontSize',15,'FontName','Times New Roman');
end
