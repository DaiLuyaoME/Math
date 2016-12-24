clear all;
close all;
clc;
%%
%bound of singular value
lowerBound=1;
upperBound=1000.0;
% matrix size, m must be bigger than n
m=200;n=100;
diagMatNum=10;
diagMat=cell(1,diagMatNum);
singularValue=cell(1,diagMatNum);

% flag=1:uniform distribution
% flag=2:normal distribution
num=n;
% wide=100;
wide=abs(upperBound-lowerBound)/10;
% narrow=10;
narrow=abs(upperBound-lowerBound)/100;
% generate singular values
for i=1:diagMatNum
    flag=i;
    switch flag
        case 1 %uniform distribution
            diagMat{i}= diagMatGen(num,lowerBound,upperBound,'unif');
            singularValue{i}=diag(diagMat{i});
        case 2 %normal distribution: mu=mid, sigma=wide;
            mu=( lowerBound+upperBound )/2;sigma=wide;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            singularValue{i}=diag(diagMat{i});
        case 3 %normal distribution: mu=lowerBound, sigma=wide;
            mu=lowerBound;sigma=wide;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            singularValue{i}=diag(diagMat{i});
        case 4 %normal distribution: mu=lowerBound, sigma=narrow;
            mu=lowerBound;sigma=narrow;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            singularValue{i}=diag(diagMat{i});
        case 5 %normal distribution: mu=upperBound, sigma=wide;
            mu=upperBound;sigma=wide;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            singularValue{i}=diag(diagMat{i});
        case 6 %normal distribution: mu=upperBound, sigma=narrow;
            mu=upperBound;sigma=narrow;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            singularValue{i}=diag(diagMat{i});
        case 7 %normal distribution: ;
            mu=lowerBound;sigma=wide;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=wide;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            singularValue{i}=diag(diagMat{i});
        case 8 %normal distribution: ;
            mu=lowerBound;sigma=narrow;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=narrow;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            singularValue{i}=diag(diagMat{i});
        case 9 %normal distribution: ;
            mu=lowerBound;sigma=narrow;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=wide;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            singularValue{i}=diag(diagMat{i});
        case 10 %normal distribution: ;
            mu=lowerBound;sigma=wide;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=narrow;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            singularValue{i}=diag(diagMat{i});
            % case 11:left mid right normal distribution
    end
end

dimGap=m-n;
temp=zeros(dimGap,n);
for i=1:diagMatNum
    diagMat{i}=[diagMat{i};temp];
end

%% generate U and V
UMatNum=10;
VMatNum=UMatNum;
UMatSize=[m,m];
VMatSize=[n,n];
UMat=cell(1,UMatNum);
VMat=cell(1,VMatNum);
%generate U
for i=1:UMatNum
    temp=random('unif',lowerBound,upperBound,UMatSize);
    [Q,R]=qr(temp);
    UMat{i}=Q;
end
% generate V
for i=1:VMatNum
    temp=random('unif',lowerBound,upperBound,VMatSize);
    [Q,R]=qr(temp);
    VMat{i}=Q;
end

%% generate A
ANum=diagMatNum*UMatNum;
A=cell(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        A{i,j}=UMat{j}*diagMat{i}*transpose(VMat{j});
    end
end

%% generate x and b
lowerX=-abs(upperBound);
upperX=abs(upperBound);
X=cell(diagMatNum,UMatNum);
b=cell(diagMatNum,UMatNum);
for i=1:diagMatNum
    for j=1:UMatNum
        X{i,j}=random('unif',lowerX,upperX,[n 1]);
        b{i,j}=A{i,j}*X{i,j};
    end
end
