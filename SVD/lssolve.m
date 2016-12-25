function [x,residual,norm_x,rank]=lssolve(A,b,flag,condBound)

if nargin==2
    flag=1;
end
[m,n]=size(A);
rcond = 1/condBound;
switch flag
    case 1 %QR full rank
        
        [~,x,~]=nag_lapack_dgels('N',A,b);
        x=x(1:n);
        
    case 2 %QR deficient rank
        jpvt = zeros(n,1,'int64');  
        [~, x, ~, rank, ~] = nag_lapack_dgelsy(A, b, jpvt, rcond);
        x=x(1:n);
    case 3 %svd
        
        [~, x, ~, rank, ~] = nag_lapack_dgelss(A, b, rcond);
        x=x(1:n);
    case 4 % svd divide and conquer
        [~, x, ~, rank, ~] = nag_lapack_dgelsd(A, b, rcond);
        x=x(1:n);
end
% size(x)
residual=norm(A*x-b);
norm_x=norm(x);
end
