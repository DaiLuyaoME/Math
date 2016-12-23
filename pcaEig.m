function [coeff,score,latent,mu]=pcaEig(data)
% PCA by eigen-value decomposition
% data:MxN matrix, M-samples, N-dimensions
% coeff: principle component vectors
% score: principle component scores
% latent: variances
% mu: mean value

[m,n]=size(data);
%shift to original point
mu=mean(data,1);
data=data-repmat(mu,m,1);
covx=data'*data./(m-1);
[coeff,latent]=eig(covx);
latent=diag(latent);
[temp,index]=sort(latent,'descend');
latent=temp;
coeff=coeff(:,index);
score=data*coeff;
