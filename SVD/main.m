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
U_svd=cell(diagMatNum,UMatNum);
% residual_qr=cell(diagMatNum,UMatNum);
V_svd=cell(diagMatNum,UMatNum);
% norm_x_qr=cell(diagMatNum,UMatNum);
S_svd=cell(diagMatNum,UMatNum);
rank_svd=cell(diagMatNum,UMatNum);
methodtype=5;
fprintf('method type is %d ',methodtype);
for i=1:diagMatNum
    tic;
    for j=1:UMatNum
        [u,s,v]=svdsolve(A{i,j},methodtype);
        U_svd{i,j}=u;V_svd{i,j}=v;S_svd{i,j}=s;
        %         [temp1,temp2,temp3]=lssolve(A{i,j},b{i,j},2);
        %         x_qr{i,j}=temp1;residual_qr{i,j}=temp2;norm_x_qr{i,j}=temp3;
    end
    toc;
end


%% residual of U
U_res=zeros(diagMatNum,m);
for i=1:diagMatNum
    U1=UMat{1};
    U2=U_svd{i,1};
    for j=1:m
        temp=norm(U1(:,j)-U2(:,j));
        if(temp>1.9)
            U_res(i,j)=norm(U1(:,j)+U2(:,j));
        else
            U_res(i,j)=temp;
            
        end
    end
end

figure;
linecolor=['r','g','b','k','y','c'];
linemarker=['o','+','*','x','s','d'];
for i=1:diagMatNum
    %     plot(U_res(i,:),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',3,'LineWidth',1);
    plot( U_res(i,4:(n-4)),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',3,'LineWidth',1);
    hold on;
end


methodname={'dgesvd','dgesdd/SVD divide and conquer','MATLAB SVD','$A{A}^{T}$','Jacobi'};
xlabel('u_{i}','FontSize',14,'FontName','Times New Roman');
% 创建 title
title(methodname{methodtype},'Interpreter','latex','FontSize',14,'FontName','Times New Roman');

% 创建 ylabel
% ${{\left\| {{u}_{i}}-u_{i}^{*} \right\|}_{2}}$
ylabel('${{\left\| {{u}_{i}}-u_{i}^{*} \right\|}_{2}}$','Interpreter','latex','FontSize',14,'FontName','Times New Roman');
legend('1','2','3','4','5','6');
axis tight;
%% residual of V
V_res=zeros(diagMatNum,n);
for i=1:diagMatNum
    V1=VMat{1};
    V2=V_svd{i,1};
    for j=1:n
        temp=norm(V1(:,j)-V2(:,j));
        if(temp>1.9)
            V_res(i,j)=norm(V1(:,j)+V2(:,j));
        else
            V_res(i,j)=temp;
        end
    end
end

figure;
linecolor=['r','g','b','k','y','c'];
linemarker=['o','+','*','x','s','d'];
for i=1:diagMatNum
    %     plot(V_res(i,:),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',3,'LineWidth',1);
    plot(V_res(i,4:end-4),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',3,'LineWidth',1);
    
    hold on;
end


methodname={'dgesvd','dgesdd/SVD divide and conquer','MATLAB SVD','$A{A}^{T}$','Jacobi'};
xlabel('v_{i}','FontSize',14,'FontName','Times New Roman');
% 创建 title
title(methodname{methodtype},'Interpreter','latex','FontSize',14,'FontName','Times New Roman');

% 创建 ylabel
ylabel('${{\left\| {{v}_{i}}-v_{i}^{*} \right\|}_{2}}$','Interpreter','latex','FontSize',14,'FontName','Times New Roman');
legend('1','2','3','4','5','6');
axis tight;


%% residual of U : Frobenius norm

% close all;
methodname={'dgesvd','dgesdd/SVD divide and conquer','MATLAB SVD','${A{A}^{T}}$','Jacobi'};
U_res=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    U1=UMat{1};
    U2=U_svd{i,1};
    for j=1:UMatNum
            U1=UMat{j};
    U2=U_svd{i,j};
    temp_res=0;
        for k=4:n-4
        temp=norm(U1(:,k)-U2(:,k));
        if(temp>1.9)
            temp_res=temp_res+norm(U1(:,k)+U2(:,k));
        else
            temp_res=temp;
        end
        end
        U_res(i,j)=temp_res;
    end
end

figure;
linecolor=['r','g','b','k','y','c'];
linemarker=['o','+','*','x','s','d'];
for i=1:diagMatNum
    plot(U_res(i,:),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',10,'LineWidth',3);
    hold on;
end
axis tight;
xlabel('Number','FontSize',14,'FontName','Times New Roman');
% 创建 title
title(methodname{methodtype},'Interpreter','latex','FontSize',14,'FontName','Times New Roman');

% 创建 ylabel
ylabel('Frobenius Norm: ${{\left\| U-{{U}^{*}} \right\|}_{F}}$','Interpreter','latex','FontSize',14,'FontName','Times New Roman');
legend('1','2','3','4','5','6');


%% residual of V : Frobenius norm

% close all;
methodname={'dgesvd','dgesdd/SVD divide and conquer','MATLAB SVD','${A{A}^{T}}$','Jacobi'};
V_res=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    V1=VMat{1};
    V2=V_svd{i,1};
    for j=1:VMatNum
            V1=VMat{j};
    V2=V_svd{i,j};
    temp_res=0;
        for k=4:n-4
        temp=norm(V1(:,k)-V2(:,k));
        if(temp>1.9)
            temp_res=temp_res+norm(V1(:,k)+V2(:,k));
        else
            temp_res=temp;
        end
        end
        V_res(i,j)=temp_res;
    end
end

figure;
linecolor=['r','g','b','k','y','c'];
linemarker=['o','+','*','x','s','d'];
for i=1:diagMatNum
    plot(V_res(i,:),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',10,'LineWidth',3);
    hold on;
end
axis tight;
xlabel('Number','FontSize',14,'FontName','Times New Roman');
% 创建 title
title(methodname{methodtype},'Interpreter','latex','FontSize',14,'FontName','Times New Roman');

% 创建 ylabel
ylabel('Frobenius Norm: ${{\left\| V-{{V}^{*}} \right\|}_{F}}$','Interpreter','latex','FontSize',14,'FontName','Times New Roman');
legend('1','2','3','4','5','6');



%% analyse S

% close all;
S_res=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        S_res(i,j)=norm(S_svd{i,j}-sort(singularValue{i},'descend'));
    end
end

figure;
linecolor=['r','g','b','k','y','c'];
linemarker=['o','+','*','x','s','d'];
for i=1:diagMatNum
    plot(S_res(i,:),'Color',linecolor(i),'Marker',linemarker(i),'MarkerSize',10,'LineWidth',3);
    hold on;
end
xlabel('Number','FontSize',14,'FontName','Times New Roman');
% 创建 title
title(methodname{methodtype},'Interpreter','latex','FontSize',14,'FontName','Times New Roman');

% 创建 ylabel
ylabel('${{\left\| S-{{S}^{*}} \right\|}_{2}}$','Interpreter','latex','FontSize',14,'FontName','Times New Roman');
legend('1','2','3','4','5','6');






