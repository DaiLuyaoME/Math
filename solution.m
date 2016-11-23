function [x,relres,resvec]=solution(A,b,flag,tol,maxIter)

	switch flag

    case 0 % steepset descent


    case 1 % conjugate gradient
    	[x,flag,relres,iter,resvec]=pcg(A,b,tol,maxIter);

    case 2 % lanczos
        [x]=lanczos(A,b,tol,maxIter);
        relres=0;resvec=0;

    case 3 % MINRES
    	[x,flag,relres,iter,resvec]=minres(A,b,tol,maxIter);


    case 4 % GMRES

    case 5 % Biconjugate gradient

    case 6 

    otherwise
    end
end

