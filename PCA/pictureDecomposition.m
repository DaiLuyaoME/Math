clear all;
close all;
clc;
picture1=imread('lib1.jpg');
picture1=rgb2gray(picture1);
picture1=double(picture1);
imshow(mat2gray(picture1));
%%
[U,S,V]=svd(picture1);
s=diag(S);
%%
sum(s>10)
%%
% bar(cumsum(s)./sum(s));
% figure;
hist(s,1000);
%%
r=500;
temp=U(:,1:r)*S(1:r,1:r)*(V(:,1:r))';
imshow(mat2gray(temp));
%%
r=1:100;
temp=U(:,r)*S(r,r)*(V(:,r))';
imshow(mat2gray(temp));