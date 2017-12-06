%%
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
    [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad);
    xList = [xList,xk];
    gradList = [gradList,gradFun(xk)];
    tList = [tList,t];
%     if ( norm(gradFun(xk)) <= TOL )
%         break;
%     end
    if(0.5 * abs(dot(tempGrad,descentDirection)) < TOL)
        break;
    end
end
xList = xList(1:j);
gradList = gradList(1:j);
objValueList = objValueList(1:j);
tList = tList(1:j);

disp('the iteration number is ');
disp(j);


%% 
load('A_m=30_n=100.mat');
load('x_1.mat');
load('b.mat');

% [n,m] = size(A);
maxIter = 1000;
gradFun = @(x)log(x) + 1;
objFun = @(x)sum(x.*log(x));
hessianFun = @(x)diag(1./x);

TOL = 1e-10;
alpha = 0.05;
beta = 0.5;

xList = [];
gradList = [];
tList = [];
xk = x_1;

[m,n] = size(A);
vk =  zeros(m,1);

for j = 1:maxIter
    tempGrad = gradFun(xk);
    [deltaX,deltaV] = solveKKTMatrix(hessianFun(xk),A,gradFun(xk)+A'*vk,A*xk-b);
    r = [gradFun(xk)+A'*vk;A*xk-b];
    if( norm(r) < TOL)
        break;
    end
    t = 1;
    while(min(xk+deltaX) <= 0)
        t = t * beta;
    end
    
    while ( norm( [ gradFun(xk+t*deltaX) + A'*(vk + t * deltaV);A*(xk+t*deltaX)-b] ) > (1 - alpha * t) * norm(r) )
        t = t * beta;
    end
    xk = xk+t*deltaX;
    vk = vk + t*deltaV;
    xList = [xList,xk];
    gradList = [gradList,gradFun(xk)];
    tList = [tList,t];
    objValueList(j) = objFun(xk);
end

    
%     [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad);


xList = xList(1:(j-1));
gradList = gradList(1:(j-1));
objValueList = objValueList(1:(j-1));
tList = tList(1:(j-1));

disp('the iteration number is ');
disp(j-1);

%%
optimalValue = objValueList(end);
figure;
plot(log10(objValueList - optimalValue));
%%
close all;
figure;
plot(objValueList)



        
        
        
        
        
    
