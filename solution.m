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
        
    case 4 % G-S preconditioner conjugate gradient
        D=diag(diag(A));
        L=tril(A,-1);
        M=(D+L)*inv(D)*(D+L');
        [x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter,M);
        fprintf('condition number of G-S-preconditioned CG is\n');
        disp(cond(inv(M)*A,2));
        
        
    case 5 % SOR preconditioner conjugate gradient
        D=diag(diag(A));
        L=tril(A,-1);
        w=0.6;
        M=( (D/w+L)*inv(D/w)*(D/w+L') )/(2-w);
        [x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter,M);
        %     case 6 % incomplete cholesky factorization preconditioner conjugate gradient
        %         L=ichol(A,struct('michol','on'));
        %         [x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter,L,L');
        fprintf('condition number of SOR-preconditioned CG is\n');
        disp(cond(inv(M)*A,2));
        
    otherwise
end
end

