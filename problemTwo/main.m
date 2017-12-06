%% ��Ctrl +��Enter ���б��ڵõ�m=50 n = 50ʱ�Ľ��
% press Ctrl + Enter to run this section, m = 50, n = 50;

load('m=50_n=50.mat');
[n,m] = size(A);
x0 = zeros(n,1);
maxIter = 1000;
gradFun = @(x)calculateGradient(A,x);
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




%% ��Ctrl +��Enter ���б��ڵõ�m=50 n = 50ʱ�Ľ��
% press Ctrl + Enter to run this section, m = 50, n = 50;
load('m=100_n=100.mat');
[n,m] = size(A);
x0 = zeros(n,1);
maxIter = 1000;
gradFun = @(x)calculateGradient(A,x);
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







