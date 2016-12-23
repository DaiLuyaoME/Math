function [coeff,score,latent,mu]=pcaSVD(data)
% PCA by singular value decomposition
% data:MxN matrix, M-samples, N-dimensions
% coeff: principle component vectors
% score: principle component scores
% latent: variances
% mu: mean value

[m,n]=size(data);
%shift to original point
mu=mean(data,1);
data=data-repmat(mu,m,1);
Y=data./sqrt((m-1));

[U,S,coeff]=svd(Y);
mn=min(m,n);
S=S(1:mn,1:mn);
S=diag(S);
latent=S.*S;
% pc=pc;
score=data*coeff;
