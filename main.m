matrixGenerator;
%%
cg=1;
lanczos=2;
minres=3;
res=zeros(3,ANum);
% rescg=zeros(1,ANum);
% reslan=zeros(1,ANum);
% minres=zeros(1,ANum);
for i=1:diagMatNum
    for j=1:QMatNum
        for k=1:3
        [x,relres,iter,resvec]=solution(A{i,j},b{i,j},k,1e-6,60);
        res(k,(i-1)*QMatNum+j)=relres;
        end
    end
end

%%
% for table 2.3.3
%diagMatNum=5;
absoluteRes=zeros(3,diagMatNum);
for i=1:diagMatNum
    for j=1:3
    [x,relres,iter,resvec]=solution(A{i,1},b{i,1},j,1e-12,80);
    absoluteRes(j,i)=relres*norm(b{i,1});
    end
end
%%
algorithmName={'CG','Lanczos','MINRES'};
figure1=figure('PaperSize',[80 60]);


for j=1:3
    subploti=subplot(1,3,j,'Parent',figure1,'FontSize',15,'FontName','Times New Roman');

    plot(absoluteRes(j,:),'Parent',subploti,'MarkerFaceColor',[0 0 1],'Marker','o','LineWidth',3,...
    'LineStyle',':',...
    'Color',[0 0 1]);
    title(algorithmName{j},'FontSize',15,'FontName','Times New Roman');
    xlabel('ÐòºÅ','FontSize',10);
    ylabel('¾ø¶ÔÎó²î','FontSize',10);
    legend('e(80)');
% hold on;
end

% plot(absoluteRes);
%% analysis the eigen value distribution
Y=zeros(11,5);
for i=1:5
[nelements,centers]=hist(diagEle{i},[0:10:100]);
x=centers;
Y(:,i)=nelements;
end
bar3(x,Y);
% bar3(centers1,nelements1,centers2,nelements2);

        
        