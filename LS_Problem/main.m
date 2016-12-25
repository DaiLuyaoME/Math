% clear all;
% close all;
% clc;

%% generate data
dataGenerator;
%% analysis the singular value distribution
close all;
num=40;
    Y=zeros(num,diagMatNum);
    zone=linspace(lowerBound,upperBound,num);
    for i=1:diagMatNum
        [nelements,centers]=hist(singularValue{i},zone);
        x=centers;
        Y(:,i)=nelements;
    end

bar3(x,Y);
axis tight;
% bar3(centers1,nelements1,centers2,nelements2);
% 创建 xlabel
xlabel('序号','FontWeight','bold','FontSize',14);

% 创建 ylabel
ylabel('奇异值分布区间','FontWeight','bold','FontSize',14);

% 创建 zlabel
zlabel('奇异值数量','FontWeight','bold','FontSize',14);
%% normalized singular value distribution
close all;
num=40;
    Y=zeros(num,diagMatNum);
    zone=linspace(lowerBound,upperBound,num);
    for i=1:diagMatNum
        [nelements,centers]=hist(singularValue{i},zone);
        x=centers./max(centers);
        Y(:,i)=nelements;
    end

bar3(x,Y);
axis tight;
% bar3(centers1,nelements1,centers2,nelements2);
% 创建 xlabel
xlabel('序号','FontWeight','bold','FontSize',14);

% 创建 ylabel
ylabel('归一化奇异值分布区间','FontWeight','bold','FontSize',14);

% 创建 zlabel
zlabel('奇异值数量','FontWeight','bold','FontSize',14);

%% solve LS problem
% x_qr=cell(diagMatNum,UMatNum);
x_svd=cell(diagMatNum,UMatNum);
% residual_qr=cell(diagMatNum,UMatNum);
residual_svd=cell(diagMatNum,UMatNum);
% norm_x_qr=cell(diagMatNum,UMatNum);
norm_x_svd=cell(diagMatNum,UMatNum);
rank_svd=cell(diagMatNum,UMatNum);
condBound=1200;
methodtype=4;
tic;
for i=1:diagMatNum
    for j=1:UMatNum 
        [temp1,temp2,temp3,temp4]=lssolve(A{i,j},b{i,j},methodtype,condBound);
        x_svd{i,j}=temp1;residual_svd{i,j}=temp2;norm_x_svd{i,j}=temp3;rank_svd{i,j}=temp4;
%         [temp1,temp2,temp3]=lssolve(A{i,j},b{i,j},2);
%         x_qr{i,j}=temp1;residual_qr{i,j}=temp2;norm_x_qr{i,j}=temp3;
    end
end
toc;
%% analyse residual
close all;
methodname={'QR for Full Rank','QR with column pivoting','SVD','SVD divide and conquer'};
svd_residual=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        svd_residual(i,j)=residual_svd{i,j};
    end
end
legendName=cell(diagMatNum);
for i=1:diagMatNum
    legendName{i}=sprintf('rank = %d',rank_svd{i,1});
end
% qr_residual=zeros(diagMatNum,UMatNum);
% for i=1:diagMatNum
%     for j=1:UMatNum
%         qr_residual(i,j)=residual_qr{i,j};
%     end
% end

figure;
linecolor=['r','g','b','k','y','c'];
linemarker=['o','+','*','x','s','d'];
for i=1:diagMatNum
    plot(svd_residual(i,:),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',10,'LineWidth',3);
    hold on;
end
xlabel('Number','FontSize',14,'FontName','Times New Roman');
% 创建 title
title(methodname{methodtype},'FontSize',14,'FontName','Times New Roman');

% 创建 ylabel
ylabel('${{\left\| Ax-b \right\|}_{2}}$','Interpreter','latex','FontSize',14,'FontName','Times New Roman');
legend(legendName{1},legendName{2},legendName{3},legendName{4},legendName{5},legendName{6});
% legend(legendName);
% figure;
% for i=1:diagMatNum
%     plot(qr_residual(i,:));
%     hold on;
% end

%% analyse norm(x-x*)
close all;
svd_dx=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        svd_dx(i,j)=norm(x_svd{i,j}-X{i,j});
    end
end

legendName=cell(diagMatNum);
for i=1:diagMatNum
    legendName{i}=sprintf('rank = %d',rank_svd{i,1});
end
% qr_residual=zeros(diagMatNum,UMatNum);
% for i=1:diagMatNum
%     for j=1:UMatNum
%         qr_residual(i,j)=residual_qr{i,j};
%     end
% end

figure;
linecolor=['r','g','b','k','y','c'];
linemarker=['o','+','*','x','s','d'];
for i=1:diagMatNum
    plot(svd_dx(i,:),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',10,'LineWidth',3);
    hold on;
end
xlabel('Number','FontSize',14,'FontName','Times New Roman');
% 创建 title
title(methodname{methodtype},'FontSize',14,'FontName','Times New Roman');

% 创建 ylabel
ylabel('${{\left\| x-{{x}^{*}} \right\|}_{2}}$','Interpreter','latex','FontSize',14,'FontName','Times New Roman');
legend(legendName{1},legendName{2},legendName{3},legendName{4},legendName{5},legendName{6});