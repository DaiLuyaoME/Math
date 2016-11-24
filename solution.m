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
        
        
    case 4 % GMRES
        
    case 5 % Biconjugate gradient
        
    case 6
        
    otherwise
end
end

