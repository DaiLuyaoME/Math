clear all;
close all;
clc;
%%
%bound of singular value
lowerBound=1.0;
upperBound=1000.0;
% matrix size, m must be bigger than n
m=800;n=400;
diagMatNum=7;
diagMat=cell(1,diagMatNum);
diagEle=cell(1,diagMatNum);

% flag=1:uniform distribution
% flag=2:normal distribution
num=n;
wide=10;
narrow=1;
for i=1:diagMatNum
    flag=i;
    switch flag
        case 1 %uniform distribution
            diagMat{i}= diagMatGen(num,lowerBound,upperBound,'unif');
            diagEle{i}=diag(diagMat{i});
        case 2 %normal distribution: mu=mid, sigma=wide;
            mu=( lowerBound+upperBound )/2;sigma=wide;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 3 %normal distribution: mu=lowerBound, sigma=wide;
            mu=lowerBound;sigma=wide;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 4 %normal distribution: mu=lowerBound, sigma=narrow;
            mu=lowerBound;sigma=narrow;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 5 %normal distribution: mu=upperBound, sigma=wide;
            mu=upperBound;sigma=wide;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 6 %normal distribution: mu=upperBound, sigma=narrow;
            mu=upperBound;sigma=narrow;
            diagMat{i}=diagMatGen(num,lowerBound,upperBound,'norm',mu,sigma);
            diagEle{i}=diag(diagMat{i});
        case 7 %normal distribution: ;
            mu=lowerBound;sigma=wide;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=wide;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            diagEle{i}=diag(diagMat{i});
        case 8 %normal distribution: ;
            mu=lowerBound;sigma=narrow;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=narrow;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            diagEle{i}=diag(diagMat{i});
        case 9 %normal distribution: ;
            mu=lowerBound;sigma=narrow;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=wide;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            diagEle{i}=diag(diagMat{i});
        case 10 %normal distribution: ;
            mu=lowerBound;sigma=wide;
            temp1=diagMatGen(ceil(num/2),lowerBound,upperBound,'norm',mu,sigma);
            mu=upperBound;sigma=narrow;
            temp2=diagMatGen(floor(num/2),lowerBound,upperBound,'norm',mu,sigma);
            diagMat{i}=diag([diag(temp1);diag(temp2)]);
            diagEle{i}=diag(diagMat{i});
         % case 11:left mid right normal distribution
    end
end