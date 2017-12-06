
load('A_m=30_n=100.mat');
load('x_0.mat');
load('b.mat');

% [n,m] = size(A);
maxIter = 1000;
gradFun = @(x)log(x) + 1;
objFun = @(x)sum(x.*log(x));
hessianFun = @(x)diag(1./x);

TOL = 1e-10;

xList = [];
gradList = [];
tList = [];
xk = x_0;

for j = 1:maxIter
    tempGrad = gradFun(xk);
    [descentDirection,~] = solveKKTMatrix(hessianFun(xk),A,gradFun(xk),0);
    if(abs(dot(tempGrad,descentDirection)) < TOL)
        break;
    end
    [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad);
    xList = [xList,xk];
    gradList = [gradList,gradFun(xk)];
    tList = [tList,t];
%     if ( norm(gradFun(xk)) <= TOL )
%         break;
%     end
end
disp('the iteration number is ');
disp(j);




        
        
        
        
        
    
