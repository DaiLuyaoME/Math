objFun = @(x)(1-x(1))^2+2*(x(2)-x(1)^2)^2;
gradFun = @(x)[-2*(1-x(1))-8*x(1)*( -1*x(1)^2+x(2));4*(-1*x(1)^2+x(2))];
hessianFun = @(x)[2 + 24*x(1)^2-8*x(2),-8 * x(1); -8 * x(1), 4];
%%
x0 = [0;0];
xList = [];
gradList = [];
tList = [];
xk = x0;
TOL = 1e-8;
maxIter = 300;

for j = 1:maxIter
    tempGrad = gradFun(xk);
    L = choleskyDecomposition(hessianFun(xk));
    temp = linsolve(L,-1 * gradFun(xk));
    descentDirection = linsolve(L',temp);
%     descentDirection = calculateDescentDirection(tempGrad,i);
    [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad);
    xList = [xList,xk];
    gradList = [gradList,gradFun(xk)];
    tList = [tList,t];
    if ( norm(gradFun(xk)) <= TOL )
        break;
    end
end