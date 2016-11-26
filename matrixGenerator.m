clear all;
close all;
clc;

%%
% Matrix Generator
lowerBound=1;
upperBound=100.0;
num=100;
diagSize=[1,num];

% generate diagMatrix
diagMatNum=5;
diagMat=cell(1,diagMatNum);
diagEle=cell(1,diagMatNum);

% flag=1:uniform distribution
% flag=2:normal distribution
for i=1:diagMatNum
    flag=i;
    switch flag
        case 1 %uniform distribution
            diagMat{i}= diagMatGen(num,lowerBound,upperBound,'unif');
            diagEle{i}=diag(diagMat{i});
        case 2 %normal distribution: mu=50, sigma=30;
            mu=50;sigma=10;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 3 %normal distribution: mu=1, sigma=30;
            mu=1;sigma=10;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 4 %normal distribution: mu=100, sigma=30;
            mu=100;sigma=10;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 5 %normal distribution: mu=50, sigma=30;
            mu=1;sigma=10;
            temp1=diagMatGen(num/2,lowerBound,upperBound,'norm',mu,sigma);
            mu=100;sigma=10;
            temp2=diagMatGen(num/2,lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            diagEle{i}=diag(diagMat{i});
    end
end
%%
% generate Q
QMatNum=10;
QMat=cell(1,QMatNum);
num=100;
QMatSize=[num,num];

rng('shuffle');
for i=1:QMatNum
    temp=random('unif',lowerBound,upperBound,QMatSize);
    [Q,R]=qr(temp);
    QMat{i}=Q;
end;

%%
% generate A
ANum=diagMatNum*QMatNum;
A=cell(diagMatNum,QMatNum);
for i=1:diagMatNum
    for j=1:QMatNum
        A{i,j}=QMat{j}*diagMat{i}*transpose(QMat{j});
    end
end

%%
%generate b and x
lowerX=-1000;
upperX=1000;
X=cell(diagMatNum,QMatNum);
b=cell(diagMatNum,QMatNum);
for i=1:diagMatNum
    for j=1:QMatNum
        X{i,j}=random('unif',lowerX,upperX,[100 1]);
        b{i,j}=A{i,j}*X{i,j};
    end
end

%% solve
% [x,flag,relres,iter,resvec]=cgs(A{1,1},b{1},1e-8,30);
% error=abs((x-X{1,1})./b{1});
