clear all;
close all;
clc;
A=reshape(1:12,3,4)';
b=A(:,2);
%%
% b=A(:,2);
A=A{8,1};
b=b{8,1};

[Q,R]=qr(A);
c=Q'*b;
x=R\c;
norm(x)
norm(A*x-b)
norm(X{8,1}-x)
plot(X{8,1}-x)
% errorbar(X{3,1},X{3,1}-x)
% x=A\b
%%
A=A{8,1};
b=b{8,1};
x=pinv(A)*b;
norm(x)
norm(A*x-b)
norm(X{8,1}-x)
%%
plot(X{3,1}-x)
errorbar(X{3,1},X{3,1}-x)