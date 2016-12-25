function [x,residual,norm_x,r]=lssolve(A,b,flag)

if nargin==2
    flag=1;
end
[m,n]=size(A);
rcond=0.00001;
switch flag
    
    
    case 1 %QR full rank
        %         [U,S,V]=svd(A);
        %         upperBound=1000;
        %         temp=upperBound/condBound;
        %         S(S<temp)=0;
        %         rank=(sum(S>0));
        %         A=U*S*V';
        %         [~,x,~]=nag_lapack_dgels('N',A,b);
        %         x=x(1:n);
        r=rank(A);
        [Q,R]=qr(A);
        c=Q'*b;
        opts.UT=true;
        x=linsolve(R,c,opts);
        
    case 2 %QR deficient rank
        jpvt = zeros(n,1,'int64');
        [~, x, ~, r, ~] = nag_lapack_dgelsy(A, b, jpvt,rcond);
        x=x(1:n);
    case 3 %svd
        
        [~, x, ~, r, ~] = nag_lapack_dgelss(A, b,rcond);
        x=x(1:n);
    case 4 % svd divide and conquer
        [~, x, ~, r, ~] = nag_lapack_dgelsd(A, b,rcond);
        x=x(1:n);
    case 5
        temp=A'*A;
        opts.SYM=true;
        x=linsolve(temp,A'*b,opts);
        r=400;
end
% size(x)
residual=norm(A*x-b)/norm(b);
norm_x=norm(x);
end
