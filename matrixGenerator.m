clear all;
close all;
clc;

% Matrix Generator
lowerBound=-100.0;
upperBound=100.0;
diagSize=[1,100];

% generate diagMatrix
diagMatNum=5;
diagMat=cell(1,diagMatNum);
diagEle=cell(1,diagMatNum);
for i=1:ceil(diagMatNum/2);
    diagEle{i}=random('unif',1,upperBound,diagSize);
    diagMat{i}= diag(diagEle{i});
end
for i=(ceil(diagMatNum/2)+1):diagMatNum;
    diagEle{i}=random('unif',1,upperBound,diagSize);
    diagMat{i}= diag(diagEle{i});
end

% generate Q
QMatNum=10;
QMat=cell(1,QMatNum);
QMatSize=[100,100];
for i=1:QMatNum
    temp=random('unif',lowerBound,upperBound,QMatSize);
    [Q,R]=qr(temp);
    QMat{i}=Q;
end;

% generate A
ANum=diagMatNum*QMatNum;
A=cell(diagMatNum,QMatNum);
for i=1:diagMatNum
    for j=1:QMatNum
        A{i,j}=QMat{j}*diagMat{i}*transpose(QMat{j});
    end
end
 
%generate b
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
[x,flag,relres,iter,resvec]=cgs(A{1,1},b{1},1e-8,30);
error=abs((x-X{1,1})./b{1});
