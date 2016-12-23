function [result]=pacRecover(score,coeff,mu)
% score : the data matrix;
% coeff : the principle component
% mu    : mean value
[m,n]=size(score);
meanValue=repmat(mu,m,1);
result=score*coeff'+meanValue;
