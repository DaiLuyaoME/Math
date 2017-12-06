
load('A_m=30_n=100.mat');
load('x_0.mat');
load('b.mat');

[n,m] = size(A);
x0 = zeros(n,1);
maxIter = 1000;
gradFun = @(x)log(x) + 1;
objFun = @(x)objectFunction(A,x);
hessianFun = @(x)calculateHessianMatrix(A,x);

TOL = 1e-8;

xList = [];
gradList = [];
tList = [];
xk = x0;

for j = 1:maxIter
    tempGrad = gradFun(xk);
    L = choleskyDecomposition(hessianFun(xk));
    temp = linsolve(L,-1 * gradFun(xk));
    descentDirection = linsolve(L',temp);
    [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad,A);
    xList = [xList,xk];
    gradList = [gradList,gradFun(xk)];
    tList = [tList,t];
    if ( norm(gradFun(xk)) <= TOL )
        break;
    end
end
disp('the iteration number is ');
disp(j);




        
        
        
        
        
    
