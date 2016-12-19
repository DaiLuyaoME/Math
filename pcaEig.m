function [signals,pc,v]=pcaEig(data)
% PCA by eigen-value decomposition
% data:MxN matrix, M-dimensions, N-samples

[m,n]=size(data);
%shift to original point
mn=mean(data,2);
data=data-repmat(mn,1,n);
covx=data*data'./(n-1);
[pc,v]=eig(covx);
v=diag(v);
[temp,index]=sort(v,'descend');
v=temp;
pc=pc(:,index);
signals=pc'*data;
