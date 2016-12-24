% clear all;
% close all;
% clc;

%% generate data
dataGenerator;

%% solve LS problem
x_qr=cell(diagMatNum,UMatNum);
x_svd=cell(diagMatNum,UMatNum);
residual_qr=cell(diagMatNum,UMatNum);
residual_svd=cell(diagMatNum,UMatNum);
norm_x_qr=cell(diagMatNum,UMatNum);
norm_x_svd=cell(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        [temp1,temp2,temp3]=lssolve(A{i,j},b{i,j},1);
        x_svd{i,j}=temp1;residual_svd{i,j}=temp2;norm_x_svd{i,j}=temp3;
        [temp1,temp2,temp3]=lssolve(A{i,j},b{i,j},2);
        x_qr{i,j}=temp1;residual_qr{i,j}=temp2;norm_x_qr{i,j}=temp3;
    end
end

%% analyse residual
svd_residual=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        svd_residual(i,j)=residual_svd{i,j};
    end
end

qr_residual=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        qr_residual(i,j)=residual_qr{i,j};
    end
end

figure;
for i=1:diagMatNum
    plot(svd_residual(i,:));
    hold on;
end

figure;
for i=1:diagMatNum
    plot(qr_residual(i,:));
    hold on;
end

%% analyse norm(x-x*)

svd_dx=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        svd_dx(i,j)=norm(x_svd{i,j}-X{i,j});
    end
end

qr_dx=zeros(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        qr_dx(i,j)=norm(x_qr{i,j}-X{i,j});
    end
end

figure;
for i=1:diagMatNum
    plot(svd_dx(i,:));
    hold on;
end

figure;
for i=1:diagMatNum
    plot(qr_dx(i,:));
    hold on;
end
