function [signals,pc,v,mu]=pcaSVD(data)
% PCA by eigen-value decomposition
% data:MxN matrix, M-samples, N-dimensions

[m,n]=size(data);
%shift to original point
mu=mean(data,1);
data=data-repmat(mu,m,1);
Y=data./sqrt((m-1));

[U,S,pc]=svd(Y);
mn=min(m,n);
S=S(1:mn,1:mn);
S=diag(S);
v=S.*S;
% pc=pc;
signals=data*pc;
