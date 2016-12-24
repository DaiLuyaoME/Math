function [x,residual,norm_x]=lssolve(A,b,flag)

if nargin==2
    flag=1;
end

switch flag
    case 0 %normal equation method
        x=inv(A'*A)*(A'*b);

    case 1 %SVD method \moor-penrose inverse method\minimal L2 norm method
        x=pinv(A)*b;
    case 2 %QR method\minimal non-zero element method
        [Q,R]=qr(A);
        c=Q'*b;
        x=R\c;
end
        residual=norm(A*x-b);
        norm_x=norm(x);
end
