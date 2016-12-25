function result=diagMatGen(matSize,lowerBound,upperBound,distribution,mu,sigma)
num=matSize;
if strcmp('unif',distribution)
    mu=0;sigma=0;
end;
switch distribution
    case 'unif' %uniform distribution
        diagTemp=random('unif',lowerBound,upperBound,[1,num]);
        diagTemp(end)=upperBound;
        diagTemp(1)=lowerBound;
    case 'norm' %normal distribution
        diagTemp=zeros(1,num);
        for i=1:num
            tempEle=normrnd(mu,sigma);
            while (tempEle<lowerBound || tempEle>upperBound)
                tempEle=normrnd(mu,sigma);
            end
            diagTemp(i)=tempEle;
        end
        diagTemp(end)=upperBound;
        diagTemp(1)=lowerBound;
end
diagTemp=sort(diagTemp,'descend');
result=diag(diagTemp);
end
