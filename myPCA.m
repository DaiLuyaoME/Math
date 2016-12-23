function [coeff,score,latent,mu]=myPCA(data,flag)
% flag=0: SVD PCA
% flag=1: Eigen Value Decomposition PCA
if nargin==1
    flag=0;
end
if (flag==0)
    [coeff,score,latent,mu]=pcaSVD(data);
else
    [coeff,score,latent,mu]=pcaEig(data);
end
end
