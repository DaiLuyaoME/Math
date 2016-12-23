function [signals,pc,v,mu]=pcaEig(data)
% PCA by eigen-value decomposition
% data:MxN matrix, M-samples, N-dimensions

[m,n]=size(data);
%shift to original point
mu=mean(data,1);
data=data-repmat(mu,m,1);
covx=data'*data./(m-1);
[pc,v]=eig(covx);
v=diag(v);
[temp,index]=sort(v,'descend');
v=temp;
pc=pc(:,index);
signals=data*pc;
