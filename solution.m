function [x,relres,iter,resvec]=solution(A,b,flag,tol,maxIter)
if nargin==3
    tol=1e-6;
    maxIter=30;
else if nargin== 4
        maxIter=30;
    end
end


switch flag
    
    case 0 % steepset descent
        
        
    case 1 % conjugate gradient
        [x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter);
        
    case 2 % lanczos
        [x,relres,iter,resvec]=lanczos(A,b,tol,maxIter);
        
    case 3 % MINRES
        [x,flag,relres,iter,resvec]=minres(A,b,tol,maxIter);
        
    case 4 % Jacobian preconditioner conjugate gradient
        [x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter,diag(diag(A));
        
    case 5 % SOR preconditioner conjugate gradient
        L=tril(A,-1); w=0.3;D=diag(A);
        M=(D+w*L)./w;
        [x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter,M);
    case 6 % incomplete cholesky factorization preconditioner conjugate gradient
        L=ichol(A);
        [x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter,L,L');
    otherwise
end
end

