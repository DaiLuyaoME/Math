%%
clear;
load('A.mat');
load('b.mat');
load('lambda.mat');
load('mu.mat');
load('P.mat');
load('q.mat');
load('x_0.mat');


% [n,m] = size(A);
maxIter = 100;
objFun = @(x)0.5 * x'*P*x + q'*x;
objPhi = @(x)-1*sum(log(x));
gradFun = @(x)P*x + q;
gradPhi = @(x)-1 * 1./x;
hessianFun = @(x)P;
hessianPhi = @(x)diag(1./x.^2);

hessianBar = @(x,t)t * hessianFun(x) + hessianPhi(x);
gradBar = @(x,t) t*gradFun(x) + gradPhi(x);
objBar = @(x,t) t*objFun(x) + objPhi(x);




xList = [];
gradList = [];
tList = [];                 
vList = [];
objValueList = [];
xk = x_0;
miu = 80;
TOL = 1e-10;
[m,n] = size(A);

%% phase one, find feasible initial point
vk =  zeros(m,1);
tempt = 1;
alpha = 0.05;
beta = 0.5;
for j = 1:maxIter
    tempGrad = gradBar(xk,tempt);
    [deltaX,deltaV] = solveKKTMatrix(hessianBar(xk,tempt),A,gradBar(xk,tempt)+A'*vk,A*xk-b);
    r = [gradBar(xk,tempt)+A'*vk;A*xk-b];
    if( norm(r) < TOL)
        break;
    end
    t = 1;
    while(min(xk+t*deltaX) <= 0)
        t = t * beta;
    end
    
    while ( norm( [ gradBar(xk+t*deltaX,tempt) + A'*(vk + t * deltaV);A*(xk+t*deltaX)-b] ) > (1 - alpha * t) * norm(r) )
        t = t * beta;
    end
    xk = xk + t*deltaX;
    vk = vk + t*deltaV;
    % vk = vk + t*deltaV;
    % xList = [xList,xk];
    % gradList = [gradList,gradBar(xk)];
    % tList = [tList,t];
    % objValueList(j) = objFun(xk);
%     if(t == 1)
%         break;
%     end
end


%%

t = 1;
for j = 1:maxIter
    tempObj = @(x)objBar(x,t);
    for k = 1:maxIter
        [descentDirection,v] = solveKKTMatrix(hessianBar(xk,t),A,gradBar(xk,t),0);
        [objValue,xk,stept,iterNum,flag] = backTrackingLineSearch(tempObj,xk,descentDirection,gradBar(xk,t));
        xList = [xList,xk];
        tList = [tList,stept];
        vList = [vList,v];
        objValueList = [objValueList,objValue];
        tempRes = dot(gradBar(xk,t),descentDirection);
        if(0.5 * abs(dot(gradBar(xk,t),descentDirection)) < 1e-8)
            break;
        end
    end
    iterationList(j) = k;
    dualIntervalList(j) = m/t;
    if(m / t < TOL)
        break;
    end
    t = t * miu;
end
% xList = xList(1:j);
% gradList = gradList(1:j);
% objValueList = objValueList(1:j);
% tList = tList(1:j);

disp('the iteration number is ');
disp(j);
% postProcessing;


%% 
% clear;
% load('A_m=30_n=100.mat');
% load('x_1.mat');
% load('b.mat');

% % [n,m] = size(A);
% maxIter = 1000;
% gradFun = @(x)log(x) + 1;
% objFun = @(x)sum(x.*log(x));
% hessianFun = @(x)diag(1./x);

% TOL = 1e-10;
% alpha = 0.05;
% beta = 0.5;

% xList = [];
% gradList = [];
% tList = [];
% xk = x_1;

% [m,n] = size(A);
% vk =  zeros(m,1);

% for j = 1:maxIter
%     tempGrad = gradFun(xk);
%     [deltaX,deltaV] = solveKKTMatrix(hessianFun(xk),A,gradFun(xk)+A'*vk,A*xk-b);
%     r = [gradFun(xk)+A'*vk;A*xk-b];
%     if( norm(r) < TOL)
%         break;
%     end
%     t = 1;
%     while(min(xk+deltaX) <= 0)
%         t = t * beta;
%     end

%     while ( norm( [ gradFun(xk+t*deltaX) + A'*(vk + t * deltaV);A*(xk+t*deltaX)-b] ) > (1 - alpha * t) * norm(r) )
%         t = t * beta;
%     end
%     xk = xk+t*deltaX;
%     vk = vk + t*deltaV;
%     xList = [xList,xk];
%     gradList = [gradList,gradFun(xk)];
%     tList = [tList,t];
%     objValueList(j) = objFun(xk);
% end


% %     [objValueList(j),xk,t,iterNum,flag] = backTrackingLineSearch(objFun,xk,descentDirection,tempGrad);


% xList = xList(1:(j-1));
% gradList = gradList(1:(j-1));
% objValueList = objValueList(1:(j-1));
% tList = tList(1:(j-1));

% disp('the iteration number is ');
% disp(j-1);

% postProcessing;









